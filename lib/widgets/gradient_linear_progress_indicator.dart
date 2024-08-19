import 'package:flutter/material.dart';

class GradientLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color color;

  const GradientLinearProgressIndicator({super.key, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: color.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: constraints.maxWidth * value,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.3),
                      color
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}