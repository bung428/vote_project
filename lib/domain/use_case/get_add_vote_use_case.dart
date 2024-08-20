import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/models/api/vote_model.dart';

class GetAddVoteUseCase {
  final VotesRepository repository;

  GetAddVoteUseCase(this.repository);

  Future<bool> call(VoteModel model) async {
    return await repository.addVote(model);
  }
}