import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/inactive_step_item.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/shipping_section.dart';
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

    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CheckOutSteps(
            pageIndex: currentPageIndex,
            pageController: pageController,
          ),
        ),
        Expanded(
            child: CheckoutStepsPageView(
          pageController: pageController,
        )),
        CustomButton(
          onPressed: () {
            pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
          },
          text: Text(
            getButtonText(pageController.page!.toInt()),
            style: AppTextStyle.bold13.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }

  String getButtonText(int currentPageIndex) {
    if (pageController.hasClients) {
      switch (currentPageIndex) {
        case 0:
          return 'التالي';
        case 1:
          return 'التالي';
        case 2:
          return 'ادفع باستخدام paypal';

        default:
          return 'التالي';
      }
    } else {
      return 'التالي';
    }
  }
}

List<Widget> getPages() {
  return [
    const ShippingSection(),
    AddressInputSection(),
    const PaymentSection(),
  ];
}
