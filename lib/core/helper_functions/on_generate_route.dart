import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/main_view.dart';
import '../../features/best_selling_faeature/views/best_selling_view.dart';
import '../../features/on_boarding/onboard_general_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'package:fruits_hub/features/auth/presentation/login_page.dart';
import 'package:fruits_hub/features/auth/presentation/signup_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case OnBoardGeneralView.routeName:
      return MaterialPageRoute(
          builder: (context) => const OnBoardGeneralView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    case LoginPage.routeName:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case SignUpPage.routeName:
      return MaterialPageRoute(builder: (context) => SignUpPage());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}