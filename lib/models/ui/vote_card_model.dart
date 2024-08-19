import 'package:vote_project/models/ui/vote_card_footer_model.dart';
import 'package:vote_project/models/ui/vote_option_model.dart';

class VoteCardModel {
  final String id;
  final String answerOptionId;
  final String content;
  final List<VoteOptionModel> options;
  final VoteCardFooterModel cardFooter;

  VoteCardModel({
    required this.id,
    required this.answerOptionId,
    required this.content,
    required this.options,
    required this.cardFooter,
  });
}