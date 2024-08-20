import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/data/votes_repository_impl.dart';
import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/domain/use_case/get_vote_use_case.dart';
import 'package:vote_project/models/ui/vote_card_model.dart';
import 'package:vote_project/route/routes.dart';
import 'package:vote_project/widgets/vote_card_widget.dart';

import 'main_notifier.dart';

class MainPage extends RiverProvider<MainNotifier, List<VoteCardModel>?> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, provider, MainNotifier notifier) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로고'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: provider == null ? const SizedBox() : ListView.builder(
          padding: const EdgeInsetsApp(horizontal: 16, vertical: 12),
          itemCount: provider.length,
          itemBuilder: (innerContext, index) => VoteCardWidget(
            model: provider[index],
            detailIdCallback: (id, optionId) =>
                context.go('${Routes.detail.name}?id=$id&optionId=$optionId'),
            likeCallback: (value) {

            },
          )
        ),
      ),
    );
  }

  @override
  MainNotifier createProvider(WidgetRef ref) {
    final match = VotesRepositoryImpl().getRepoProvider(ref) as VotesRepository;
    return MainNotifier(null, GetVoteUseCase(match));
  }
}