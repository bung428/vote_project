import 'package:vote_project/models/ui/vote_card_footer_model.dart';
import 'package:vote_project/models/ui/vote_option_model.dart';

class VoteCardModel {
  final String id;
  final int? answerOptionId;
  final String content;
  final List<VoteOptionModel> options;
  final VoteCardFooterModel cardFooter;

  VoteCardModel({
    this.answerOptionId,
    required this.id,
    required this.content,
    required this.options,
    required this.cardFooter,
  });
}