import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';
import 'package:flutter_riverpod_koo/stream_subscription.dart';
import 'package:vote_project/domain/use_case/get_vote_detail_use_case.dart';
import 'package:vote_project/models/api/vote_model.dart';
import 'package:vote_project/models/ui/vote_detail_data_model.dart';

class VoteDetailNotifier extends RiverNotifier<VoteDetailDataModel?>
    with AppStreamSubscription {
  final (String, String) ids;
  final GetVoteDetailUseCase voteDetailUseCase;

  VoteDetailNotifier(super.state, this.voteDetailUseCase, this.ids);

  @override
  void onInit() {
    streamSubscription(
      stream: Stream.fromFuture(voteDetailUseCase(ids.$1)),
      onData: (_) {
        state = _?.detailModel;
      }
    );
  }
}