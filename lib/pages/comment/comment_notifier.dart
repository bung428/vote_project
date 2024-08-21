import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:flutter_riverpod_koo/stream_subscription.dart';
import 'package:vote_project/domain/use_case/get_comments_use_case.dart';
import 'package:vote_project/models/api/comment_in_model.dart';
import 'package:vote_project/models/api/comment_model.dart';
import 'package:vote_project/models/api/user_model.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/service/firestore_service.dart';

class CommentViewModel {
  bool enable;
  List<bool>? cICEnable;
  List<bool>? isClickCIC;
  List<UserModel>? users;
  List<CommentModel>? comments;
  Map<String, List<CommentInModel>>? commentInComments;

  CommentViewModel({
    this.comments,
    this.commentInComments,
    this.users,
    this.isClickCIC,
    this.enable = false,
    this.cICEnable,
  });

  CommentViewModel copyWith({
    bool? enable,
    List<bool>? cICEnable,
    List<bool>? isClickCIC,
    List<UserModel>? users,
    List<CommentModel>? comments,
    Map<String, List<CommentInModel>>? commentInComments,
  }) => CommentViewModel(
    enable: enable ?? this.enable,
    cICEnable: cICEnable ?? this.cICEnable,
    isClickCIC: isClickCIC ?? this.isClickCIC,
    comments: comments ?? this.comments,
    commentInComments: commentInComments ?? this.commentInComments,
    users: users ?? this.users,
  );
}

class CommentNotifier extends RiverNotifier<CommentViewModel> with AppStreamSubscription {
  final String voteId;
  final GetCommentsUseCase commentsUseCase;
  final commentFocus = FocusNode();
  final cICommentFocusNode = FocusNode();
  final commentController = TextEditingController();
  List<TextEditingController>? cICommentControllers;

  CommentNotifier(super.state, this.voteId, this.commentsUseCase);

  @override
  void onInit() async {
    _fetchComments();
    _fetchCIComments();
    commentController.addListener(_updateEnable);
    commentFocus.addListener(_checkCICNode);
    cICommentFocusNode.addListener(_checkCICNode);
  }

  @override
  void dispose() {
    commentFocus.removeListener(_checkCICNode);
    cICommentFocusNode.removeListener(_checkCICNode);
    commentController.removeListener(_updateEnable);
    // cICommentControllers

    commentController.dispose();
    cICommentFocusNode.dispose();
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
          final uids = commentsData.map((comment) => comment.uid).toSet().toList();
          final userSnapshots = await FirestoreService
              .instance
              .collection(StoreCollection.user)
              .where('uid', whereIn: uids)
              .get();

          cICommentControllers = commentsData
              .map((e) => TextEditingController()..addListener(_updateCICEnable))
              .toList();

          if (mounted) {
            state = state.copyWith(
                users: userSnapshots.docs.map((e) => UserModel.fromJson(e.data()))
                    .toList(),
                isClickCIC: commentsData.map((e) => false).toList(),
                cICEnable: commentsData.map((e) => false).toList(),
                comments: commentsData
            );
          }
        },
    );
  }

  void _fetchCIComments() {
    streamSubscription(
      stream: commentsUseCase.fetchCICCommentStream(voteId),
      onData: (_) async {
        final docs = _.docs;
        if (docs.isEmpty) return;

        Map<String, List<CommentInModel>> data = {};
        for (final doc in docs) {
          List comments = doc.data()['comments'];
          final commentsData = comments.map((e) => CommentInModel.fromJson(e)).toList();
          data[doc.id] = commentsData;
        }

        if (mounted) {
          state = state.copyWith(
              commentInComments: data.isEmpty ? null : data,
          );
        }
      },
    );
  }

  void _updateEnable() {
    state = state.copyWith(enable: commentController.text.isNotEmpty);
  }

  void _updateCICEnable() {
    var cICEnables = state.cICEnable;
    if (cICEnables == null) return;
    if (cICommentControllers == null) return;

    for (int idx=0; idx<cICommentControllers!.length; idx++) {
      cICEnables[idx] = cICommentControllers![idx].text.isNotEmpty;
      state = state.copyWith(cICEnable: cICEnables);
    }
  }

  void _checkCICNode() {
    if (!cICommentFocusNode.hasFocus || !commentFocus.hasFocus) {

    }
  }

  void updateCICState(int index) {
    var isClickCIC = state.isClickCIC;
    if (isClickCIC == null) return;

    isClickCIC[index] = !isClickCIC[index];
    state = state.copyWith(isClickCIC: isClickCIC);
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
          state = state.copyWith(enable: false);
        }
      }
    );
  }

  void addCommentInComment(int commentIdx) {
    var users = state.users;
    if (users == null || users.isEmpty) return;
    if (AuthService.instance.user.value == null) return;
    if (cICommentControllers == null) return;


    final model = CommentInModel(
        cid: '$commentIdx',
        uid: AuthService.instance.user.value!.uid,
        content: cICommentControllers![commentIdx].text,
        updatedAt: DateTime.now()
    );

    streamSubscription(
      stream: Stream.fromFuture(commentsUseCase.addCIComment(voteId, commentIdx, model)),
      onData: (_) {
        if (_) {
          var isClickCIC = state.isClickCIC;
          var cICEnable = state.cICEnable;
          isClickCIC?[commentIdx] = false;
          cICEnable?[commentIdx] = false;
          cICommentControllers?[commentIdx].text = '';
          state = state.copyWith(isClickCIC: isClickCIC, cICEnable: cICEnable);
        }
      },
    );
  }
}