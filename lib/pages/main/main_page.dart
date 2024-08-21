import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vote_project/data/votes_repository_impl.dart';
import 'package:vote_project/domain/repository/votes_repository.dart';
import 'package:vote_project/domain/use_case/get_vote_use_case.dart';
import 'package:vote_project/route/routes.dart';
import 'package:vote_project/service/app_service.dart';
import 'package:vote_project/service/auth_service.dart';
import 'package:vote_project/widgets/vote_card_widget.dart';

import 'main_notifier.dart';

class MainPage extends RiverProvider<MainNotifier, MainViewModel> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, provider, MainNotifier notifier) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('로고'),
      ),
      body: SafeArea(
        child: provider.voteCards == null ? const SizedBox() : ListView.builder(
          padding: const EdgeInsetsApp(horizontal: 16, top: 12, bottom: 48),
          itemCount: provider.voteCards!.length,
          itemBuilder: (innerContext, index) => VoteCardWidget(
            model: provider.voteCards![index],
            detailIdCallback: (id, optionId) =>
                context.push('${Routes.detail.name}?id=$id&optionId=$optionId'),
            likeCallback: notifier.updateVoteLike,
            menuCallback: (id) async {
              final result = await notifier.deleteVote(id);
              if (result) {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('투표가 삭제되었습니다.')));
              }
            },
            commentCallback: (id) => context.push('${Routes.comment.name}?id=$id'),
          )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: provider.isShowFabOptions,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    ScaffoldMessenger
                        .of(context)
                        .showSnackBar(const SnackBar(content: Text('로그아웃이 되었습니다.')));
                    notifier.updateToggleFab();
                    AuthService.instance.logOut();
                  },
                  child: const Icon(Icons.logout),
                ),
                const SizedBox(height: 8,),
                FloatingActionButton(
                  onPressed: () async {
                    if (!AppService.instance.isLogin) {
                      final result = await context.push(Routes.login.name);
                      if (result == true) {
                        notifier.updateToggleFab();
                        // ignore: use_build_context_synchronously
                        final result = await context.push(Routes.addVote.name);
                        if (result == true) {
                          notifier.fetchVotes();
                        }
                      }
                    } else {
                      notifier.updateToggleFab();
                      final result = await context.push(Routes.addVote.name);
                      if (result == true) {
                        notifier.fetchVotes();
                      }
                    }
                  },
                  child: const Icon(Icons.create),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            onPressed: notifier.updateToggleFab,
            child: Icon(provider.isShowFabOptions ? Icons.close : Icons.add),
          ),
        ],
      )
    );
  }

  @override
  MainNotifier createProvider(WidgetRef ref) {
    final match = VotesRepositoryImpl().getRepoProvider(ref) as VotesRepository;
    return MainNotifier(MainViewModel(), GetVoteUseCase(match));
  }
}