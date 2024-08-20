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


part 'vote_model.freezed.dart';
part 'vote_model.g.dart';

@freezed
class VoteModel with _$VoteModel {
  factory VoteModel({
    required String id,
    required String content,
    required int answerCnt,
    required int likeCnt,
    required int commentCnt,
    List<VoteLikeModel>? voteLiked,
    List<VoteEntryModel>? voteEntries,
    required List<VoteDetailModel> options
  }) = _VoteModel;

  factory VoteModel.fromJson(Map<String, dynamic> json) => _$VoteModelFromJson(json);
}

extension VoteModelExt on VoteModel {
  VoteCardModel get cardModel => VoteCardModel(
      id: id,
      answerOptionId: voteEntries
          ?.firstWhereOrNull(
              (e) => e.uid == AuthService.instance.user.value?.uid)
          ?.answerOptionId,
      content: content,
      options: options.map((e) => VoteOptionModel(
        id: e.id,
        image: e.image,
        content: e.content,
        percent: (e.answerCnt / answerCnt * 100).toInt(),
      )).toList(),
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
      options: options.map((e) => VoteOptionModel(
        id: e.id,
        image: e.image,
        content: e.content,
        percent: (e.answerCnt / answerCnt * 100).toInt(),
      )).toList(),
      answerCnt: answerCnt,
      voteGenderRates: options.map((e) => VoteGenderRateModel(
          id: e.id,
          content: e.content,
          image: e.image,
          malePercent: (e.genderCnt.male / answerCnt * 100).toInt(),
          femalePercent: (e.genderCnt.female / answerCnt * 100).toInt()
      )).toList(),
  );
}