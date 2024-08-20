import 'package:freezed_annotation/freezed_annotation.dart';

import 'gender_count_model.dart';

part 'vote_detail_model.freezed.dart';
part 'vote_detail_model.g.dart';

@freezed
class VoteDetailModel with _$VoteDetailModel {
  factory VoteDetailModel({
    required int id,
    required String content,
    required String image,
    required int answerCnt,
    required GenderCountModel genderCnt,
  }) = _VoteDetailModel;

  factory VoteDetailModel.fromJson(Map<String, dynamic> json) => _$VoteDetailModelFromJson(json);
}