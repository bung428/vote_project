import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/models/api/vote_model.dart';

class GetVoteDetailUseCase {
  final VotesRepository repository;

  GetVoteDetailUseCase(this.repository);

  Future<VoteModel?> call(String id) async {
    return await repository.getVoteById(id);
  }

  Future<bool> updateOption(String voteId, int optionId) async {
    return await repository.updateOption(voteId, optionId);
  }
}