import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';
import 'package:flutter_riverpod_koo/river_pod/river_provider.dart';
import 'package:vote_project/pages/comment/comment_notifier.dart';
import 'package:vote_project/widgets/app_button_widget.dart';

class CommentPage extends RiverProvider<CommentNotifier, bool> {
  final String id;

  const CommentPage({super.key, required this.id});

  @override
  bool outsideUnFocus() => false;

  @override
  Widget build(BuildContext context, provider, notifier) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('댓글'),),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsetsApp(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Text('asdfasdfasd'),
                  Text('asdfasdfasd'),
                  Text('asdfasdfasd'),
                ],
              ),
            ),
            AppBottomButton(
              child: Text('입력'),
              onTap: provider ? notifier.addComment : null,
            )
          ],
        ),
      ),
    );
  }

  @override
  CommentNotifier createProvider(WidgetRef ref) {
    return CommentNotifier(false, id);
  }
}