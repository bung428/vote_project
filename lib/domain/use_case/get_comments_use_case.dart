import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_project/domain/repository/comment_repository.dart';
import 'package:vote_project/models/api/comment_in_model.dart';
import 'package:vote_project/models/api/comment_model.dart';

class GetCommentsUseCase {
  final CommentRepository repository;

  GetCommentsUseCase(this.repository);

  Stream<QuerySnapshot<Map<String, dynamic>>> call(String voteId) {
    return repository.fetchCommentStream(voteId);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchCICCommentStream(String voteId) {
    return repository.fetchCICCommentStream(voteId);
  }

  Future<bool> addComment(String voteId, CommentModel model) async {
    return await repository.addComment(voteId, model);
  }

  Future<bool> addCIComment(String voteId, int idx, CommentInModel model) async {
    return await repository.addCIComment(voteId, idx, model);
  }
}