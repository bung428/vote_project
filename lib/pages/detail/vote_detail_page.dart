import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/data/votes_repository_impl.dart';
import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/domain/use_case/get_vote_detail_use_case.dart';
import 'package:vote_project/enums/gender.dart';
import 'package:vote_project/main.dart';
import 'package:vote_project/models/ui/vote_detail_data_model.dart';
import 'package:vote_project/pages/detail/vote_detail_notifier.dart';
import 'package:vote_project/route/routes.dart';
import 'package:vote_project/service/app_service.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/widgets/detail/table_title_widget.dart';
import 'package:vote_project/widgets/gradient_linear_progress_indicator.dart';
import 'package:vote_project/widgets/vote_option_list_widget.dart';

class VoteDetailPage extends RiverProvider<VoteDetailNotifier, VoteDetailDataModel?> {
  final String id;
  final String optionId;

  const VoteDetailPage({super.key, required this.id, required this.optionId, });

  @override
  Widget build(BuildContext context, provider, notifier) {
    final theme = Theme.of(context);
    if (provider == null) {
      return const SizedBox();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('상세'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsApp(horizontal: 16, vertical: 12),
                child: Text(provider.title, style: theme.textColor.semiBold(18),),
              ),
              const Divider(thickness: 1,),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsetsApp(horizontal: 16, top: 12, bottom: 4),
                child: VoteOptionListWidget(
                  provider.options,
                  provider.answerOptionId,
                  optionCallback: (_) async {
                    if (!AppService.instance.isLogin) {
                      final result = await context.push(Routes.login.name);
                      if (result == true) {
                        notifier.selectOptionById(_);
                      }
                    } else {
                      notifier.selectOptionById(_);
                    }
                  },
                  isDetail: true
                ),
              ),
              Padding(
                padding: const EdgeInsetsApp(horizontal: 16, vertical: 12),
                child: Text('${provider.answerCnt} 참여'),
              ),
              /// Gender Rate Widget
              Padding(
                padding: const EdgeInsetsApp(horizontal: 16, vertical: 12),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        const SizedBox(),
                        TableCell(child: Icon(Icons.male, color: theme.colorScheme.primary,)),
                        TableCell(child: Transform.rotate(
                          angle: 45 * pi / 180,
                          child: Icon(Icons.female, color: theme.colorScheme.error,)
                        )),
                      ]
                    ),
                    ...provider.voteGenderRates.map((e) => TableRow(
                      children: [
                        TableTitleWidget(image: e.image, content: e.content),
                        ...Gender.values.map((value) {
                          final isUser = AuthService.instance.user.value?.gender;
                          return _buildGenderRate(
                            theme,
                            e.id == provider.answerOptionId && isUser == value,
                            value.getPercent(e),
                            value.color,
                          );
                        }),
                      ]
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  VoteDetailNotifier createProvider(WidgetRef ref) {
    final match = VotesRepositoryImpl().getRepoProvider(ref) as VotesRepository;
    return VoteDetailNotifier(
        null,
        GetVoteDetailUseCase(match),
        (id, optionId),
    );
  }

  Container _buildGenderRate(
    ThemeData theme,
    bool isVoted,
    int value,
    Color color
  ) => Container(
    height: 52,
    margin: const EdgeInsetsApp(all: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: isVoted ? Border.all(color: Colors.black) : null,
      gradient: isVoted ? LinearGradient(
        colors: [
          color.withOpacity(0.3),
          color
        ],
      ) : null,
      color: color.withOpacity(0.1),
    ),
    alignment: Alignment.centerRight,
    child: Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GradientLinearProgressIndicator(
                color: color,
                value: value / 100,
              )
          ),
        ),
        Positioned(
          right: 12,
          child: Container(
            height: 52,
            alignment: Alignment.center,
            child: Text('$value%'))
        ),
      ],
    ),
  );
}
