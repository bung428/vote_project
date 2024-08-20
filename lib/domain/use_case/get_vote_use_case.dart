import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/models/api/vote_model.dart';

class GetVoteUseCase {
  final VotesRepository repository;

  GetVoteUseCase(this.repository);

  Future<List<VoteModel>?> call() async {
    return await repository.getVotes();
  }

  Future<void> updateVoteLikeState(String id, VoteModel? model) async {
    await repository.updateVoteLikeState(id, model);
  }

  Future<bool> deleteVote(String id) async {
    return await repository.deleteVote(id);
  }
}