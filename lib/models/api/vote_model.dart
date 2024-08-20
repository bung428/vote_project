import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vote_project/models/api/vote_detail_model.dart';
import 'package:vote_project/models/api/vote_entry_model.dart';
import 'package:vote_project/models/api/vote_like_model.dart';
import 'package:vote_project/models/ui/vote_card_footer_model.dart';
import 'package:vote_project/models/ui/vote_card_model.dart';
import 'package:vote_project/models/ui/vote_detail_data_model.dart';
import 'package:vote_project/models/ui/vote_gender_rate_model.dart';
import 'package:vote_project/models/ui/vote_option_model.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/util/timestamp_converter.dart';

part 'vote_model.freezed.dart';
part 'vote_model.g.dart';

@freezed
class VoteModel with _$VoteModel {
  factory VoteModel({
    required String id,
    required String ownerUid,
    required String content,
    required int answerCnt,
    required int likeCnt,
    required int commentCnt,
    List<VoteLikeModel>? voteLiked,
    List<VoteEntryModel>? voteEntries,
    required List<VoteDetailModel> options,
    @TimestampConverter() required DateTime createdAt,
  }) = _VoteModel;

  factory VoteModel.fromJson(Map<String, dynamic> json) => _$VoteModelFromJson(json);
}

extension VoteModelExt on VoteModel {
  VoteCardModel get cardModel => VoteCardModel(
      id: id,
      canDelete: ownerUid == AuthService.instance.user.value?.uid,
      answerOptionId: voteEntries
          ?.firstWhereOrNull(
              (e) => e.uid == AuthService.instance.user.value?.uid)
          ?.answerOptionId,
      content: content,
      options: _updateOptions,
      cardFooter: footerModel
  );

  VoteCardFooterModel get footerModel => VoteCardFooterModel(
      answerCnt: answerCnt,
      likeCnt: likeCnt,
      commentCnt: commentCnt,
      hasLiked: voteLiked
        ?.firstWhereOrNull(
            (e) => e.uid == AuthService.instance.user.value?.uid)
          ?.hasLiked ?? false);

  VoteDetailDataModel get detailModel => VoteDetailDataModel(
    title: content,
    answerOptionId: voteEntries
        ?.firstWhereOrNull(
            (e) => e.uid == AuthService.instance.user.value?.uid)
        ?.answerOptionId,
    options: _updateOptions,
    answerCnt: answerCnt,
    voteGenderRates: _updateGenderRates,
  );

  List<VoteOptionModel> get _updateOptions {
    var percents = options.map((e) {
      var value = e.answerCnt / answerCnt * 100;
      if (value.isInfinite || value.isNaN) {
        return 0;
      } else {
        return value.round();
      }
    }).toList();
    var totalPercent = percents.fold(0, (sum, e) => sum + e);
    if (totalPercent > 0) {
      final diff = 100 - totalPercent;
      if (diff > 0) {
        percents.first += diff;
      } else {
        percents.first -= diff;
      }
    }
    List<VoteOptionModel> result = [];
    for (int idx=0; idx<options.length; idx++) {
      result.add(VoteOptionModel(
          id: options[idx].id,
          image: options[idx].image,
          content: options[idx].content,
          percent: percents[idx]
      ));
    }
    return result;
  }

  List<VoteGenderRateModel> get _updateGenderRates {
    List<int> percents = [];
    for (int idx=0; idx<options.length; idx++) {
      var maleDouble = options[idx].genderCnt.male / answerCnt * 100;
      var maleValue = 0;
      if (maleDouble.isInfinite || maleDouble.isNaN) {
        maleValue = 0;
      } else {
        maleValue = maleDouble.round();
      }
      var femaleDouble = options[idx].genderCnt.female / answerCnt * 100;
      var femaleValue = 0;
      if (femaleDouble.isInfinite || femaleDouble.isNaN) {
        femaleValue = 0;
      } else {
        femaleValue = femaleDouble.round();
      }
      percents.add(maleValue);
      percents.add(femaleValue);
    }

    var totalPercent = percents.fold(0, (sum, e) => sum + e);
    if (totalPercent > 0) {
      final diff = 100 - totalPercent;
      if (diff > 0) {
        percents.first += diff;
      } else {
        percents.first -= diff;
      }
    }

    List<int> male = [];
    List<int> female = [];
    for (int idx=0; idx<percents.length; idx++) {
      if (idx % 2 == 0) {
        male.add(percents[idx]);
      } else {
        female.add(percents[idx]);
      }
    }

    List<VoteGenderRateModel> result = [];
    for (int idx=0; idx<options.length; idx++) {
      result.add(VoteGenderRateModel(
          id: options[idx].id,
          content: options[idx].content,
          image: options[idx].image,
          malePercent: male[idx],
          femalePercent: female[idx]
      ));
    }
    return result;
  }
}