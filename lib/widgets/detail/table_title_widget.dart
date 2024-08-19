import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_koo/edge_insets.dart';

class TableTitleWidget extends StatelessWidget {
  final String image;
  final String content;

  const TableTitleWidget({super.key, required this.image, required this.content});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 52,
      margin: const EdgeInsetsApp(all: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
              imageUrl: image,
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
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            ),
          ),
          Expanded(
            child: Container(
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)
                  ),
                  color: theme.colorScheme.primary.withOpacity(0.1),
                ),
                padding: const EdgeInsetsApp(start: 8),
                alignment: Alignment.centerLeft,
                child: Text(content)),
          ),
        ],
      ),
    );
  }
}
