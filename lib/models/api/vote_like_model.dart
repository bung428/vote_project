import 'package:freezed_annotation/freezed_annotation.dart';

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