import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_project/models/api/comment_in_model.dart';
import 'package:vote_project/models/api/comment_model.dart';

abstract class CommentRepository {
  Future<bool> addComment(String voteId, CommentModel model);
  Future<bool> addCIComment(String voteId, int idx, CommentInModel model);

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchCommentStream(String voteId);
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchCICCommentStream(String voteId);
}