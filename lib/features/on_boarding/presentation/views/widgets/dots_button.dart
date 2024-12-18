import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'page_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fruits_hub/core/helper_functions/colors.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub/core/constants/constants.dart';

class DotsButtonView extends StatefulWidget {
  const DotsButtonView({super.key});

  @override
  State<DotsButtonView> createState() => _DotsButtonViewState();
}

class _DotsButtonViewState extends State<DotsButtonView> {
  late PageController _pageController;
  var currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
      print(currentPage);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: _pageController,
          isVisible: currentPage == 0 ? true : false,
        )),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColor.primaryColors,
              color: currentPage == 1
                  ? AppColor.primaryColors
                  : AppColor.primaryColors.withOpacity(.5)),
        ),
        Visibility(
          visible: !(currentPage == 0 ? true : false),
          maintainAnimation: true,
          maintainSize: false,
          maintainState: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 39),
            child: CustomButton(
              onPressed: () {
                SharedPreferencesSSingleton.setBool(kIsBoardingViewSeen, true);
                Navigator.of(context).pushReplacementNamed('loginPage');
              },
              text: Text('ابدأ الان'),
            ),
          ),
        ),
      ],
    );
  }
}
