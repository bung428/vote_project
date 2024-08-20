import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:flutter_riverpod_koo/stream_subscription.dart';
import 'package:vote_project/domain/use_case/get_vote_use_case.dart';
import 'package:vote_project/models/api/vote_like_model.dart';
import 'package:vote_project/models/api/vote_model.dart';
import 'package:vote_project/models/ui/vote_card_model.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/service/firestore_service.dart';

class MainViewModel {
  List<VoteCardModel>? voteCards;
  List<VoteModel>? votes;
  bool isShowFabOptions;

  MainViewModel({this.voteCards, this.votes, this.isShowFabOptions = false});

  MainViewModel copyWith({
    List<VoteCardModel>? voteCards,
    List<VoteModel>? votes,
    bool? isShowFabOptions,
  }) => MainViewModel(
      voteCards: voteCards ?? this.voteCards,
      votes: votes ?? this.votes,
      isShowFabOptions: isShowFabOptions ?? this.isShowFabOptions,
  );
}

class MainNotifier extends RiverNotifier<MainViewModel>
    with AppStreamSubscription {
  MainNotifier(super.state, this.voteUseCase);

  final GetVoteUseCase voteUseCase;

  @override
  void onInit() async {
    final result = await voteUseCase();
    state = MainViewModel(
      votes: result,
      voteCards: result?.map((e) => e.cardModel).toList()
    );

    streamSubscription(
      stream: FirestoreService
          .instance
          .collection(StoreCollection.votes)
          .orderBy('createdAt', descending: true)
          .snapshots(),
      onData: (query) {
        if (query.docs.isEmpty) return;

        final votes = query.docs.map((e) => VoteModel.fromJson(e.data())).toList();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            state = state.copyWith(
                votes: votes,
                voteCards: votes.map((e) => e.cardModel).toList()
            );
          }
        });
      }
    );
  }

  void fetchVotes() {
    streamSubscription<List<VoteModel>?>(
      stream: Stream.fromFuture(voteUseCase()),
      onData: (_) {
        state = state.copyWith(
          votes: _,
          voteCards: _?.map((e) => e.cardModel).toList()
        );
      }
    );
  }

  void updateToggleFab() {
    state = state.copyWith(isShowFabOptions: !state.isShowFabOptions);
  }

  Future<bool> deleteVote(String id) {
    final c = Completer<bool>();
    streamSubscription<bool>(
        stream: Stream.fromFuture(voteUseCase.deleteVote(id)),
        onData: (_) {
          if (_) {
            c.complete(_);
          }
        }
    );
    return c.future;
  }

  void updateVoteLike(String voteId, bool value) async {
    final updatedVotes = _updateVotes(voteId);
    final updatedVoteCards = _updateVoteCards(voteId, value);

    state = state.copyWith(
      votes: updatedVotes,
      voteCards: updatedVoteCards,
    );

    var updatedModel = state.votes?.firstWhere((e) => e.id == voteId);
    if (updatedModel == null) return;

    var likeCnt = updatedModel.likeCnt;
    updatedModel = updatedModel.copyWith(
      likeCnt: value ? ++likeCnt : --likeCnt
    );
    await voteUseCase.updateVoteLikeState(voteId, updatedModel);
  }

  List<VoteModel>? _updateVotes(String voteId) {
    final uid = AuthService.instance.user.value?.uid;
    if (uid == null) return null;

    final selectedVote = state.votes?.firstWhereOrNull((e) => e.id == voteId);
    if (selectedVote == null) return null;

    List<VoteLikeModel>? updatedVoteLiked = (selectedVote.voteLiked ?? []).map((voteLike) {
      if (voteLike.uid == uid) {
        return voteLike.copyWith(hasLiked: !voteLike.hasLiked);
      } else {
        return voteLike;
      }
    }).toList();

    if (!updatedVoteLiked.any((voteLike) => voteLike.uid == uid)) {
      updatedVoteLiked.add(VoteLikeModel(uid: uid, hasLiked: true));
    }

    return (state.votes)?.map((e) {
      if (e.id == voteId) {
        return e.copyWith(voteLiked: updatedVoteLiked);
      } else {
        return e;
      }
    }).toList();
  }

  List<VoteCardModel>? _updateVoteCards(String voteId, bool value) {
    VoteCardModel? selected = state.voteCards?.firstWhereOrNull((e) => e.id == voteId);
    if (selected == null) return null;

    selected.cardFooter.hasLiked = value;
    value ? selected.cardFooter.likeCnt++ : selected.cardFooter.likeCnt--;

    return (state.voteCards)?.map((e) {
      if (e.id == voteId) {
        e = selected;
      }
      return e;
    }).toList();
  }
}