import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vote_project/models/api/vote_detail_model.dart';
import 'package:vote_project/models/ui/vote_card_footer_model.dart';
import 'package:vote_project/models/ui/vote_card_model.dart';
import 'package:vote_project/models/ui/vote_detail_data_model.dart';
import 'package:vote_project/models/ui/vote_gender_rate_model.dart';
import 'package:vote_project/models/ui/vote_option_model.dart';


part 'vote_like_model.freezed.dart';
part 'vote_like_model.g.dart';

@freezed
class VoteLikeModel with _$VoteLikeModel {
  factory VoteLikeModel({
    required String uid,
    required bool hasLiked,
  }) = _VoteLikeModel;

  factory VoteLikeModel.fromJson(Map<String, dynamic> json) => _$VoteLikeModelFromJson(json);
}