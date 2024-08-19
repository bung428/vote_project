import 'package:flutter_riverpod_koo/stream_subscription.dart';
import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:vote_project/domain/use_case/get_vote_use_case.dart';
import 'package:vote_project/models/api/vote_model.dart';
import 'package:vote_project/models/ui/vote_card_model.dart';

class MainNotifier extends RiverNotifier<List<VoteCardModel>?>
    with AppStreamSubscription {
  MainNotifier(super.state, this.voteUseCase);

  final GetVoteUseCase voteUseCase;

  @override
  void onInit() async {
    state = (await voteUseCase())?.map((e) => e.cardModel).toList();
  }
}