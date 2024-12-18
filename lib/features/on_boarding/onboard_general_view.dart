import 'package:flutter/material.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/dots_button.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardGeneralView extends StatelessWidget {
  const OnBoardGeneralView({super.key});
  static const String routeName = 'onBoardingView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DotsButtonView(),
      ),
    );
  }
}
