import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vote_project/models/api/vote_detail_model.dart';
import 'package:vote_project/models/ui/vote_card_footer_model.dart';
import 'package:vote_project/models/ui/vote_card_model.dart';
import 'package:vote_project/models/ui/vote_detail_data_model.dart';
import 'package:vote_project/models/ui/vote_gender_rate_model.dart';
import 'package:vote_project/models/ui/vote_option_model.dart';


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