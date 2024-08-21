import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:flutter_riverpod_koo/stream_subscription.dart';
import 'package:intl/intl.dart';
import 'package:vote_project/domain/use_case/get_comments_use_case.dart';
import 'package:vote_project/models/api/comment_model.dart';
import 'package:vote_project/models/api/user_model.dart';
import 'package:vote_project/models/ui/comment_item_model.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/service/firestore_service.dart';

class CommentViewModel {
  List<CommentItemModel>? comments;
  bool enable;

  CommentViewModel({this.comments, this.enable = false});

  CommentViewModel copyWith({
    List<CommentItemModel>? comments,
    bool? enable,
  }) => CommentViewModel(
    comments: comments ?? this.comments,
    enable: enable ?? this.enable
  );
}

class CommentNotifier extends RiverNotifier<CommentViewModel> with AppStreamSubscription {
  final String voteId;
  final commentController = TextEditingController();
  final GetCommentsUseCase commentsUseCase;

  CommentNotifier(super.state, this.voteId, this.commentsUseCase);

  @override
  void onInit() {
    _fetchComments();
    commentController.addListener(_updateEnable);
  }

  @override
  void dispose() {
    commentController.removeListener(_updateEnable);
    commentController.dispose();
    super.dispose();
  }

  void _fetchComments() {
    streamSubscription(
        stream: commentsUseCase(voteId),
        onData: (_) async {
          final docs = _.docs;
          if (docs.isEmpty) return;

          List comments = docs.first.data()['comments'];
          final commentsData = comments.map((e) => CommentModel.fromJson(e)).toList();
          final uids = comments.map((comment) => comment['uid']).toSet().toList();
          final userSnapshots = await FirestoreService
              .instance
              .collection(StoreCollection.user)
              .where('uid', whereIn: uids)
              .get();
          final users = userSnapshots.docs.map((e) => UserModel.fromJson(e.data())).toList();

          if (mounted) {
            state = state.copyWith(
                comments: commentsData.map((e) =>
                    CommentItemModel(
                        id: users
                            .firstWhereOrNull((u) => u.uid == e.uid)
                            ?.id ?? '',
                        content: e.content,
                        updatedAt: DateFormat('yy.MM.dd').format(e.updatedAt)
                    )).toList()
            );
          }
        }
    );
  }

  void _updateEnable() {
    state = state.copyWith(enable: commentController.text.isNotEmpty);
  }

  void addComment() {
    if (AuthService.instance.user.value == null) return;

    final model = CommentModel(
      uid: AuthService.instance.user.value!.uid,
      content: commentController.text,
      updatedAt: DateTime.now()
    );
    streamSubscription(
      stream: Stream.fromFuture(commentsUseCase.addComment(voteId, model)),
      onData: (_) {
        if (_) {
          commentController.text = '';
        }
      }
    );
  }
}