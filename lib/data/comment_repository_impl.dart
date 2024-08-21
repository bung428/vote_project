import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_koo/river_pod/river_repository.dart';
import 'package:vote_project/domain/repository/comment_repository.dart';
import 'package:vote_project/models/api/comment_model.dart';
import 'package:vote_project/service/firestore_service.dart';

class CommentRepositoryImpl extends RiverRepository implements CommentRepository {
  @override
  RiverRepository createRiverRepo() => CommentRepositoryImpl();

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchCommentStream(String voteId) {
    return FirestoreService
        .instance
        .collection(StoreCollection.votes)
        .doc(voteId)
        .collection(StoreCollection.comments.path)
        .snapshots();
  }

  @override
  Future<bool> addComment(String voteId, CommentModel model) async {
    try {
      final querySnapshot = await FirestoreService
          .instance
          .collection(StoreCollection.votes)
          .doc(voteId)
          .collection(StoreCollection.comments.path)
          .where('comments')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final documentSnapshot = querySnapshot.docs.first;
        List current = documentSnapshot.data()['comments'];
        current.add(model.toJson());
        await documentSnapshot.reference.update({
          'comments': current
        });
      } else {
        await FirestoreService
            .instance
            .collection(StoreCollection.votes)
            .doc(voteId)
            .collection(StoreCollection.comments.path)
            .doc()
            .set({'comments': [model.toJson()]});
      }

      final voteDoc = FirestoreService
          .instance
          .collection(StoreCollection.votes)
          .doc(voteId);
      final snapshot = await voteDoc.get();
      if (snapshot.data() == null) return false;

      int cnt = snapshot.data()!['commentCnt'];
      voteDoc.update({'commentCnt': cnt + 1});

      return true;
    } catch(_) {
      debugPrint('KBG addComment : $_');
      return false;
    }
  }
}