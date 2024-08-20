import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_entry_model.freezed.dart';
part 'vote_entry_model.g.dart';

@freezed
class VoteEntryModel with _$VoteEntryModel {
  factory VoteEntryModel({
    required String uid,
    required int answerOptionId,
  }) = _VoteEntryModel;

  factory VoteEntryModel.fromJson(Map<String, dynamic> json) => _$VoteEntryModelFromJson(json);
}