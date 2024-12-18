import 'package:flutter/material.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/widgets/page_widget.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/helper_functions/colors.dart';
import 'package:fruits_hub/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub/core/constants/constants.dart';

class OnBoardingPageView extends StatefulWidget {
  OnBoardingPageView(
      {super.key, required this.pageController, required this.isVisible});

  late PageController pageController;
  final bool isVisible;

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.pageController,
      children: [
        PageWidget(
            backgroundImage: Assets.imagesSplash1up,
            image: Assets.imagesCenteredimagesplash1,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                ' مرحبا بك في ',
                style: AppTextStyle.bold23,
              ),
              Text(
                'Fruit',
                style: AppTextStyle.semiBold16
                    .copyWith(color: AppColor.primaryColors),
              ),
              Text('Hub '),
            ]),
            uptext: GestureDetector(
                onTap: () {
                  SharedPreferencesSSingleton.setBool(
                      kIsBoardingViewSeen, true);
                  Navigator.of(context).pushReplacementNamed('loginPage');
                },
                child: Text('تخطي')),
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية'),
        PageWidget(
          image: Assets.imagesPineapple,
          backgroundImage: Assets.imagesVector,
          subtitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          title: Visibility(
            visible: widget.isVisible,
            child: Row(children: const [
              Text(
                'ابحث وتسوق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0C0D0D),
                  fontSize: 23,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              )
            ]),
          ),
          uptext: Text(widget.isVisible ? 'skip' : " "),
        ),
      ],
    );
  }
}
