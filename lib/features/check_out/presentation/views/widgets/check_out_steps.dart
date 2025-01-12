import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/inactive_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/step_item.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      4,
      (index) {
        return Expanded(
          child: StepItem(
            index: index+1,
           isActive: false,
            text: getSteps()[index],
          ),
        );
      },
    ));
  }
}

List<String> getSteps() {
  return['الشحن','الدفع','العنوان','المراجعة'];
}
