import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/inactive_step_item.dart';

import '../../../../../core/widgets/custom_button.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckOutSteps(),
       Expanded(child: CheckoutStepsPageView(pageController: pageController,)),
        CustomButton(
          onPressed: () {},
          text: Text(
            'التالي',
            style: AppTextStyle.bold13.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 32,),
      ],
    );
  }
}
