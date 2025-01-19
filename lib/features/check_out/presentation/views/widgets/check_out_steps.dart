import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/inactive_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/step_item.dart';

class CheckOutSteps extends StatelessWidget {
  CheckOutSteps(
      {super.key, required this.pageIndex, required this.pageController});
  int pageIndex;
  PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      getSteps().length,
      (index) {
        return Expanded(
          child: Center(
            child: GestureDetector(
              onTap: () {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceIn);
              },
              child: StepItem(
                index: index + 1,
                isActive: index <= pageIndex,
                text: getSteps()[index],
              ),
            ),
          ),
        );
      },
    ));
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'المراجعة'];
}
