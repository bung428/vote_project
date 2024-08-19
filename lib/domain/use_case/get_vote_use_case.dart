import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/models/api/vote_model.dart';

class GetVoteUseCase {
  final VotesRepository repository;

  GetVoteUseCase(this.repository);

  Future<List<VoteModel>?> call() async {
    return await repository.getVotes();
  }
}