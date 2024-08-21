import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/data/comment_repository_impl.dart';
import 'package:vote_project/domain/repository/comment_repository.dart';
import 'package:vote_project/domain/use_case/get_comments_use_case.dart';
import 'package:vote_project/main.dart';
import 'package:vote_project/pages/comment/comment_notifier.dart';
import 'package:vote_project/route/routes.dart';
import 'package:vote_project/widgets/app_button_widget.dart';
import 'package:vote_project/widgets/app_text_field_widget.dart';
import 'package:vote_project/widgets/touch_well_widget.dart';

import '../../service/app_service.dart';

class CommentPage extends RiverProvider<CommentNotifier, CommentViewModel> {
  final String id;

  const CommentPage({super.key, required this.id});

  @override
  bool outsideUnFocus() => true;

  @override
  Widget build(BuildContext context, provider, notifier) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('댓글'),),
      body: SafeArea(
        child: Stack(
          children: [
            if (provider.comments != null)
              ListView.separated(
                padding: const EdgeInsetsApp(horizontal: 16, top: 12, bottom: 100),
                itemCount: provider.comments!.length,
                itemBuilder: (context, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 52,
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.primary.withOpacity(0.2)
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              provider.comments?[index].uid.isNotEmpty == true
                              // provider.comments?[index].id.isNotEmpty == true
                              //     ? provider.comments![index].id[0].toUpperCase()
                                  ? provider.comments![index].uid[0].toUpperCase()
                                  : ''
                            ),
                          ),
                          const SizedBox(width: 16,),
                          Expanded(child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.comments![index].content,
                                style: theme.textColor.regular(16),
                              ),
                              Row(
                                children: [
                                  Text(
                                    provider.comments![index].updatedAt.toString(),
                                    style: theme.disabledColor.light(10),
                                  ),
                                  const SizedBox(width: 8,),
                                  TouchWell(
                                    onTap: () => notifier.updateCICState(index),
                                    child: Text(
                                      '답글 달기',
                                      style: theme.textColor.light(10),
                                    )
                                  )
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    if (provider.commentInComments != null)
                      Visibility(
                          visible: provider.commentInComments!['$index'] != null,
                          child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsetsApp(start: 60),
                          itemCount: provider.commentInComments!['$index']?.length,
                          itemBuilder: (context, idx) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.commentInComments?['$index']?[idx].content ?? '',
                                  style: theme.textColor.regular(16),
                                ),
                                Text(
                                  provider.commentInComments?['$index']?[idx].updatedAt.toString() ?? '',
                                  style: theme.disabledColor.light(10),
                                ),
                              ],
                            );
                          },
                        )
                      ),
                    Visibility(
                      visible: provider.isClickCIC?[index] ?? false,
                      child: Padding(
                        padding: const EdgeInsetsApp(start: 60),
                        child: SizedBox(
                          height: 52,
                          child: Row(
                            children: [
                              Expanded(
                                  child: AppTextFieldWidget(
                                    hintText: '답글을 입력해주세요.',
                                    textInputType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    focusNode: notifier.cICommentFocusNode,
                                    inputFormatters: [LengthLimitingTextInputFormatter(20)],
                                    textController: notifier.cICommentControllers?[index],
                                  )
                              ),
                              const SizedBox(width: 12,),
                              AppButton(
                                width: 32,
                                onTap: provider.cICEnable?[index] != null && provider.cICEnable![index] ? () async {
                                  if (!AppService.instance.isLogin) {
                                    final result = await context.push(Routes.login.name);
                                    if (result == true) {
                                      notifier.addCommentInComment(index);
                                    }
                                  } else {
                                    notifier.addCommentInComment(index);
                                  }
                                } : null,
                                style: theme.getBtnSubStyle,
                                child: const Text('입력'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                separatorBuilder: (context, index) => const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(thickness: 1,),
                    SizedBox(height: 4,)
                  ],
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: theme.scaffoldBackgroundColor
                ),
                padding: const EdgeInsetsApp(horizontal: 16, bottom: 16),
                alignment: Alignment.center,
                width: double.infinity,
                height: 64,
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextFieldWidget(
                        hintText: '댓글을 입력해주세요.',
                        focusNode: notifier.commentFocus,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        textController: notifier.commentController,
                      )
                    ),
                    const SizedBox(width: 12,),
                    AppButton(
                      width: 32,
                      onTap: provider.enable ? () async {
                        if (!AppService.instance.isLogin) {
                          final result = await context.push(Routes.login.name);
                          if (result == true) {
                            notifier.addComment();
                          }
                        } else {
                          notifier.addComment();
                        }
                      } : null,
                      style: theme.getBtnSubStyle,
                      child: const Text('입력'),
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

  @override
  CommentNotifier createProvider(WidgetRef ref) {
    final match = CommentRepositoryImpl().getRepoProvider(ref) as CommentRepository;
    return CommentNotifier(
      CommentViewModel(comments: null),
      id,
      GetCommentsUseCase(match)
    );
  }
}