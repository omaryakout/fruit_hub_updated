import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  StepItem(
      {super.key,
      required this.text,
      required this.index,
      required this.isActive});
  final String text;
  final num index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InactiveStepItem(
          int: index,
          text: text,
        ),
        secondChild: ActiveStepItem(
          text: text,
        ),
        crossFadeState: isActive == true
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300));
  }
}
