import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import '../../../../../core/services/firebase_auth.dart';
import '../../../../auth/presentation/login_page.dart';
import '../../../../home/main_view.dart';
import '../../../../on_boarding/onboard_general_view.dart';
import 'package:fruits_hub/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub/core/constants/constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SvgPicture.asset(Assets.imagesFreepikPlantInject63)]),
        SvgPicture.asset(Assets.imagesImg),
        SvgPicture.asset(
          Assets.imagesFreepikCirclesInject5,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isonboardseen =
        SharedPreferencesSSingleton.getBool(kIsBoardingViewSeen);
    Future.delayed(const Duration(seconds: 10), () {
      if (isonboardseen) {
        var isLoggedin = FireBaseAuthService().isLoggedin();
        if(isLoggedin ){
         Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
        }
        else{ 
Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
        }
        
      } else {
        Navigator.of(context)
            .pushReplacementNamed(OnBoardGeneralView.routeName);
      }
    });
  }
}
