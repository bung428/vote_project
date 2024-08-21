import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_project/models/api/vote_model.dart';

abstract class VotesRepository {
  Future<List<VoteModel>?> getVotes();
  Future<VoteModel?> getVoteById(String id);

  Future<void> updateVoteLikeState(String id, VoteModel? model);
  Future<bool> updateOption(String voteId, int optionId);

  Future<bool> addVote(VoteModel model);
  Future<bool> deleteVote(String id);

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchVotesStream();
}