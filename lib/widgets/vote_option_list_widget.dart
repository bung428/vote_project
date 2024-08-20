import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:vote_project/main.dart';
import 'package:vote_project/models/ui/vote_option_model.dart';
import 'package:vote_project/widgets/gradient_linear_progress_indicator.dart';
import 'package:vote_project/widgets/touch_well_widget.dart';

typedef OptionCallback = void Function(int id);

class VoteOptionListWidget extends StatelessWidget {
  final int? answerOptionId;
  final bool isDetail;
  final List<VoteOptionModel> list;
  final OptionCallback? optionCallback;

  const VoteOptionListWidget(
    this.list,
    this.answerOptionId, {
    super.key,
    this.isDetail = false,
    this.optionCallback
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _OptionWidget(
          list[index],
          list[index].id == answerOptionId,
          optionCallback,
          isDetail: isDetail,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 8,),
        itemCount: list.length
    );
  }
}

class _OptionWidget extends StatelessWidget {
  final bool isVoted;
  final bool isDetail;
  final VoteOptionModel model;
  final OptionCallback? optionCallback;

  const _OptionWidget(
    this.model,
    this.isVoted,
    this.optionCallback, {
    this.isDetail = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TouchWell(
      onTap: optionCallback == null ? null : () => optionCallback?.call(model.id),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: isVoted ? Colors.black : Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: model.image,
                imageBuilder: (context, imageProvider) => AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain
                        )
                    ),
                  ),
                ),
                /// todo: skeleton?
                placeholder: (context, url) => Container(
                  width: 52,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 52,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)
                          ),
                          child: GradientLinearProgressIndicator(
                            color: theme.colorScheme.primary,
                            value: model.percent / 100,
                          )
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding: const EdgeInsetsApp(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                model.content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: isVoted ? theme.textColor : theme.disabledColor.withOpacity(0.2)
                                ),
                              ),
                            ),
                            // const Spacer(),
                            if (isVoted && isDetail) ...[
                              Container(
                                height: 24,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onSurface,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsetsApp(horizontal: 4),
                                child: Center(
                                  child: Text('YOU', style: TextStyle(
                                      color: theme.scaffoldBackgroundColor
                                  ),),
                                ),
                              ),
                              const SizedBox(width: 8,)
                            ],
                            Text('${model.percent}%', style: TextStyle(
                              color: isVoted ? theme.textColor : theme.disabledColor.withOpacity(0.2)
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}