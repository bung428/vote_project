import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:flutter_riverpod_koo/stream_subscription.dart';
import 'package:vote_project/domain/use_case/get_add_vote_use_case.dart';
import 'package:vote_project/models/api/gender_count_model.dart';
import 'package:vote_project/models/api/vote_detail_model.dart';
import 'package:vote_project/models/api/vote_model.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/service/firestore_service.dart';

class AddVoteViewModel {
  bool enable;
  bool optionsEnable;
  int optionCnt;
  List<TextEditingController> controllers;

  AddVoteViewModel({
    this.enable = false,
    this.optionsEnable = false,
    required this.controllers,
    this.optionCnt = 2
  });

  AddVoteViewModel copyWith({
    bool? enable,
    bool? optionsEnable,
    int? optionCnt,
    List<FocusNode>? focusNodes,
    List<TextEditingController>? controllers,
  }) => AddVoteViewModel(
    enable: enable ?? this.enable,
    optionsEnable: optionsEnable ?? this.optionsEnable,
    optionCnt: optionCnt ?? this.optionCnt,
    controllers: controllers ?? this.controllers,
  );
}

class AddVoteNotifier extends RiverNotifier<AddVoteViewModel> with AppStreamSubscription {
  AddVoteNotifier(super.state, this.addVoteUseCase);

  final GetAddVoteUseCase addVoteUseCase;
  final titleController = TextEditingController();

  @override
  void onInit() {
    var controllers = state.controllers;
    for (var e in controllers) {
      e.addListener(_updateEnable);
    }
    titleController.addListener(_updateEnable);
  }

  @override
  void dispose() {
    titleController.removeListener(_updateEnable);
    super.dispose();
  }

  void _updateEnable() {
    var controllers = state.controllers;
    var list = <bool>[];
    for (final controller in controllers) {
      list.add(controller.text.isNotEmpty);
    }
    state = state.copyWith(enable: !list.contains(false) && titleController.text.isNotEmpty);
  }

  void addOption() {
    var cnt = ++state.optionCnt;
    var controllers = state.controllers;
    controllers.add(TextEditingController()..addListener(_updateEnable));

    state = state.copyWith(
      optionCnt: cnt,
      controllers: controllers
    );
  }

  void deleteOption(int index) {
    if (state.optionCnt < 3) return;

    var controllers = state.controllers;
    controllers[index].removeListener(_updateEnable);
    controllers[index].dispose();
    controllers.removeAt(index);

    var cnt = --state.optionCnt;

    state = state.copyWith(
      optionCnt: cnt,
      controllers: controllers
    );
  }

  Future<bool> addVote() {
    final c = Completer<bool>();
    final docRef = FirestoreService.instance.collection(StoreCollection.votes).doc();
    final docId = docRef.id;

    late VoteModel model;
    try {
      model = VoteModel(
          id: docId,
          ownerUid: AuthService.instance.user.value!.uid,
          content: titleController.text,
          answerCnt: 0,
          likeCnt: 0,
          commentCnt: 0,
          createdAt: DateTime.now(),
          options: state.controllers.map((e) {
            final index = state.controllers.indexOf(e);
            return VoteDetailModel(
                id: index + 1,
                content: e.text,
                image: "https://play-lh.googleusercontent.com/2lkeoOpCjQhBaYam0RbwT1oLpOBGiFNE9gPnc7Mbi1rqi6oGAwG5qVkjebskBmat_Q=s94-rw",
                answerCnt: 0,
                genderCnt: GenderCountModel(
                  male: 0,
                  female: 0
                )
            );
          }).toList()
      );
    } catch (_) {
      c.complete(false);
    }

    streamSubscription<bool>(
      stream: Stream.fromFuture(addVoteUseCase(model)),
      onData: (_) {
        c.complete(_);
      }
    );
    return c.future;
  }
}