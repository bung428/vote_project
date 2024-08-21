import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_koo/river_pod/river_repository.dart';
import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/enums/gender.dart';
import 'package:vote_project/models/api/gender_count_model.dart';
import 'package:vote_project/models/api/vote_detail_model.dart';
import 'package:vote_project/models/api/vote_entry_model.dart';
import 'package:vote_project/models/api/vote_model.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/service/firestore_service.dart';

class VotesRepositoryImpl extends RiverRepository implements VotesRepository {
  @override
  RiverRepository createRiverRepo() => VotesRepositoryImpl();

  @override
  Future<List<VoteModel>?> getVotes() async {
    try {
      final query = await FirestoreService
          .instance
          .collection(StoreCollection.votes)
          .orderBy('createdAt', descending: true)
          .get();
      if (query.docs.isEmpty) return null;
      return query.docs.map((e) => VoteModel.fromJson(e.data())).toList();
    } catch (_) {
      debugPrint('KBG getVotes error : $_');
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
      debugPrint('KBG getVoteById error : $_');
      return null;
    }
  }

  @override
  Future<void> updateVoteLikeState(String id, VoteModel? model) async {
    if (model == null) return;

    try {
      await FirestoreService.instance
          .collection(StoreCollection.votes)
          .doc(id)
          .update(model.toJson());
    } catch (error) {
      debugPrint('KBG updateVoteLikeState error: $error');
    }
  }

  @override
  Future<bool> updateOption(String voteId, int optionId) async {
    final user = AuthService.instance.user.value;
    if (user == null) return false;

    final query = await FirestoreService
        .instance
        .collection(StoreCollection.votes)
        .doc(voteId)
        .get();
    if (!query.exists || query.data() == null) return false;

    try {
      final data = VoteModel.fromJson(query.data()!);
      final oldOptionId = data.voteEntries?.firstWhereOrNull((e) => e.uid == user.uid)?.answerOptionId;
      if (optionId == oldOptionId) return false;

      List<VoteEntryModel>? updatedEntries = (data.voteEntries)?.map((e) {
        if (e.uid == user.uid) {
          return e.copyWith(answerOptionId: optionId);
        }
        return e;
      }).toList();
      if (oldOptionId == null) {
        if (updatedEntries == null) {
          updatedEntries = [VoteEntryModel(uid: user.uid, answerOptionId: optionId)];
        } else {
          updatedEntries.add(
              VoteEntryModel(uid: user.uid, answerOptionId: optionId));
        }
      }

      var answerCnt = data.answerCnt;
      final oldOptions = data.options.firstWhereOrNull((e) => e.id == oldOptionId);
      if (oldOptions == null) {
        answerCnt++;
      }

      List<VoteDetailModel> updatedOptions = data.options.map((e) {
        var cnt = e.answerCnt;
        var genderCnt = user.gender == Gender.male
            ? e.genderCnt.male : e.genderCnt.female;

        if (e.id == oldOptions?.id) {
          return e.copyWith(
              answerCnt: --cnt,
              genderCnt: user.gender == Gender.male
                  ? GenderCountModel(male: --genderCnt, female: e.genderCnt.female)
                  : GenderCountModel(male: e.genderCnt.male, female: --genderCnt)
          );
        }
        if (e.id == optionId) {
          return e.copyWith(
            answerCnt: ++cnt,
            genderCnt: user.gender == Gender.male
                ? GenderCountModel(male: ++genderCnt, female: e.genderCnt.female)
                : GenderCountModel(male: e.genderCnt.male, female: ++genderCnt)
          );
        }
        return e;
      }).toList();

      await FirestoreService.instance
          .collection(StoreCollection.votes)
          .doc(voteId)
          .update({
        'answerCnt': answerCnt,
        'options': updatedOptions.map((e) => e.toJson()).toList(),
        'voteEntries': updatedEntries?.map((e) => e.toJson()).toList(),
      });
      return true;
    } catch (error) {
      debugPrint('KBG updateOption error: $error');
      return false;
    }
  }

  @override
  Future<bool> addVote(VoteModel model) async {
    try {
      await FirestoreService.instance
          .collection(StoreCollection.votes)
          .doc(model.id)
          .set(model.toJson());
      return true;
    } catch (error) {
      debugPrint('KBG addVote error: $error');
      return false;
    }
  }

  @override
  Future<bool> deleteVote(String id) async {
    try {
      await FirestoreService.instance
          .collection(StoreCollection.votes)
          .doc(id)
          .delete();

      return true;
    } catch (error) {
      debugPrint('KBG addVote error: $error');
      return false;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchVotesStream() {
    return FirestoreService
        .instance
        .collection(StoreCollection.votes)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}