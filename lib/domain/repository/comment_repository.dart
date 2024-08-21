import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_project/models/api/comment_model.dart';

abstract class CommentRepository {
  Future<bool> addComment(String voteId, CommentModel model);

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchCommentStream(String voteId);
}