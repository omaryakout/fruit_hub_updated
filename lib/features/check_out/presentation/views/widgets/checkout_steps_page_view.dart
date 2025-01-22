import 'package:flutter/material.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/check_out_steps.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/check_out_view_body.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/payment_section.dart';
import 'package:fruits_hub/features/check_out/presentation/views/widgets/shipping_section.dart';
import 'check_out_view_body.dart';

class CheckoutStepsPageView extends StatelessWidget {
  CheckoutStepsPageView({super.key, required this.pageController,required this.formKey});
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: getPages()[index],
        );
      },
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
    );
  }


  List<Widget> getPages() {
  return [
    const ShippingSection(),
    AddressInputSection(formKey: formKey,),
    const PaymentSection(),
  ];
}
}
