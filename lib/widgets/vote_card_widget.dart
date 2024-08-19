import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:vote_project/models/ui/vote_card_footer_model.dart';
import 'package:vote_project/models/ui/vote_card_model.dart';
import 'package:vote_project/widgets/touch_well_widget.dart';
import 'package:vote_project/widgets/vote_option_list_widget.dart';

typedef DetailIdCallback = void Function(String id, String optionId);

class VoteCardWidget extends StatelessWidget {
  final VoteCardModel model;
  final DetailIdCallback detailIdCallback;

  const VoteCardWidget({
    super.key,
    required this.model,
    required this.detailIdCallback
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      child: TouchWell(
        onTap: () => detailIdCallback.call(model.id, model.answerOptionId),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsetsApp(all: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.content),
              const Divider(thickness: 1,),
              const SizedBox(height: 12,),
              VoteOptionListWidget(model.options, model.answerOptionId),
              const SizedBox(height: 12,),
              _CardFooterWidget(model.cardFooter)
            ],
          ),
        ),
      ),
    );
  }
}

class _CardFooterWidget extends StatelessWidget {
  final VoteCardFooterModel model;

  const _CardFooterWidget(this.model);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${model.answerCnt} 참여'),
        Row(
          children: [
            model.hasLiked ? Icon(
              Icons.favorite,
              color: theme.colorScheme.error,
            ) : const Icon(Icons.favorite_border_outlined),
            const SizedBox(width: 4,),
            Text('${model.likeCnt}'),
            const SizedBox(width: 8,),
            const Icon(Icons.insert_comment_outlined),
            const SizedBox(width: 4,),
            Text('${model.commentCnt}'),
            const SizedBox(width: 4,),
            const Icon(Icons.more_vert),
          ],
        )
      ],
    );
  }
}
