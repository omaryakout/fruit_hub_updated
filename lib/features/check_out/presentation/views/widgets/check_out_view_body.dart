import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/inactive_step_item.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            children: List.generate(
          4,
          (index) {
            return InactiveStepItem(
              int: index + 1,
              text: 'الشحن',
            );
          },
        ))
      ],
    );
  }
}
