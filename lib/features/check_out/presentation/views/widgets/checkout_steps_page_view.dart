import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/check_out_view_body.dart';

class CheckoutStepsPageView extends StatelessWidget {
  CheckoutStepsPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return Placeholder();
      },
      physics: AlwaysScrollableScrollPhysics(),
      controller: pageController,
    );
  }
}
