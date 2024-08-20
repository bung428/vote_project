import 'package:vote_project/models/api/vote_model.dart';

abstract class VotesRepository {
  Future<List<VoteModel>?> getVotes();
  Future<VoteModel?> getVoteById(String id);
}