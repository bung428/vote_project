import 'package:flutter_riverpod_koo/river_pod/river_notifier.dart';

class CommentNotifier extends RiverNotifier<bool> {
  final String voteId;

  CommentNotifier(super.state, this.voteId);

  @override
  void onInit() {
    // TODO: implement onInit
  }

  void addComment() {

  }
}