import 'package:vote_project/models/ui/vote_gender_rate_model.dart';
import 'package:vote_project/models/ui/vote_option_model.dart';

class VoteDetailDataModel {
  final String title;
  final String answerOptionId;
  final int answerCnt;
  final List<VoteOptionModel> options;
  final List<VoteGenderRateModel> voteGenderRates;

  VoteDetailDataModel({
    required this.title,
    required this.options,
    required this.answerOptionId,
    required this.answerCnt,
    required this.voteGenderRates
  });
}