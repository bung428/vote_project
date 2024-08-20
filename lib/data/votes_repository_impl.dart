import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_koo/river_pod/river_repository.dart';
import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/models/api/vote_model.dart';
import 'package:vote_project/service/firestore_service.dart';

class VotesRepositoryImpl extends RiverRepository implements VotesRepository {
  @override
  Future<List<VoteModel>?> getVotes() async {
    try {
      final query = await FirestoreService
          .instance
          .collection(StoreCollection.votes)
          .get();
      if (query.docs.isEmpty) return null;
      return query.docs.map((e) => VoteModel.fromJson(e.data())).toList();
      final jsonStr = await rootBundle
          .loadString('assets/json/sample_data.json');
      if (jsonStr.isEmpty) return null;

      List jsonData = json.decode(jsonStr);
      return jsonData.map((e) => VoteModel.fromJson(e)).toList();
    } catch (_) {
      print('KBG getVotes error : $_');
      return null;
    }
  }

  @override
  Future<VoteModel?> getVoteById(String id) async {
    try {
      final votesResult = await getVotes();
      if (votesResult == null) return null;

      final selected = votesResult.firstWhereOrNull((e) => e.id == id);
      return Future.value(selected);
    } catch (_) {
      return null;
    }
  }

  @override
  RiverRepository createRiverRepo() => VotesRepositoryImpl();
}