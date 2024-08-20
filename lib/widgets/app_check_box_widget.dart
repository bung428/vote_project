import 'package:flutter/material.dart';
import 'package:vote_project/widgets/touch_well_widget.dart';

typedef CheckCallback =  void Function(bool? value);

class AppCheckBoxWidget extends StatelessWidget {
  final bool value;
  final double size;
  final CheckCallback checkCallback;
  final OutlinedBorder? shape;

  const AppCheckBoxWidget({
    super.key,
    required this.value,
    required this.checkCallback,
    this.size = 20,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shape = this.shape ?? const CircleBorder();
    return TouchWell(
      bgColor: theme.scaffoldBackgroundColor,
      onTap: () => checkCallback.call(!value),
      shape: shape,
      child: Checkbox(value: value, onChanged: checkCallback),
    );
    // return Transform.scale(
    //   scale: 0.8,
    //   child: Checkbox(
    //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     visualDensity: const VisualDensity(
    //       horizontal: VisualDensity.minimumDensity,
    //       vertical: VisualDensity.minimumDensity,
    //     ),
    //     value: value,
    //     onChanged: checkCallback,
    //     shape: shape,
    //   ),
    // );
  }
}
