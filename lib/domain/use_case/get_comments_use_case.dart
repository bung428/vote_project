import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_project/domain/repository/comment_repository.dart';
import 'package:vote_project/models/api/comment_model.dart';

class GetCommentsUseCase {
  final CommentRepository repository;

  GetCommentsUseCase(this.repository);

  Stream<QuerySnapshot<Map<String, dynamic>>> call(String voteId) {
    return repository.fetchCommentStream(voteId);
  }

  Future<bool> addComment(String voteId, CommentModel model) async {
    return await repository.addComment(voteId, model);
  }
}