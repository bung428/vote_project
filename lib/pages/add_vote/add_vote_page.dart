import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/data/votes_repository_impl.dart';
import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/domain/use_case/get_add_vote_use_case.dart';
import 'package:vote_project/pages/add_vote/add_vote_notifier.dart';
import 'package:vote_project/widgets/app_button_widget.dart';
import 'package:vote_project/widgets/app_text_field_widget.dart';

class AddVotePage extends RiverProvider<AddVoteNotifier, AddVoteViewModel> {
  const AddVotePage({super.key});

  @override
  bool outsideUnFocus() => true;

  @override
  Widget build(BuildContext context, provider, notifier) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('투표 만들기'),),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsetsApp(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24,),
                  AppTextFieldWidget(
                    hintText: '투표 제목',
                    textController: notifier.titleController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 12,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AppTextFieldWidget(
                        hintText: '항목 ${index + 1}',
                        textController: provider.controllers[index],
                        textInputType: TextInputType.text,
                        textInputAction: index == (provider.optionCnt - 1)
                            ? TextInputAction.done : TextInputAction.next,
                        // textCallback: (_) => notifier.setOptionTitle(_, index),
                        suffixCallback: index > 1
                            ? () => notifier.deleteOption(index) : null,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 8),
                    itemCount: provider.optionCnt
                  ),
                  const SizedBox(height: 12,),
                  AppButton(
                    onTap: notifier.addOption,
                    child: const Text('항목 추가'),
                  ),
                ],
              ),
            ),
            AppBottomButton(
              onTap: provider.enable ? () async {
                final result = await notifier.addVote();
                if (result) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('투표가 생성 되었습니다.')));
                  // ignore: use_build_context_synchronously
                  context.pop(result);
                }
              } : null,
              child: const Text('만들기'),
            )
          ],
        ),
      ),
    );
  }

  @override
  AddVoteNotifier createProvider(WidgetRef ref) {
    final match = VotesRepositoryImpl().getRepoProvider(ref) as VotesRepository;
    return AddVoteNotifier(AddVoteViewModel(
      controllers: [
        TextEditingController(),
        TextEditingController(),
      ],
    ), GetAddVoteUseCase(match));
  }
}