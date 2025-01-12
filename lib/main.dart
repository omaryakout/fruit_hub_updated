import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/get_it.dart';
import 'core/services/shared_pref_singleton.dart';
import 'core/helper_functions/on_generate_route.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/on_boarding/onboard_general_view.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:fruits_hub/core/helper_functions/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSSingleton.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    var kcolorScheme = ColorScheme.fromSeed(seedColor: AppColor.primaryColors);
    return MaterialApp(
        theme: ThemeData(
            colorScheme: kcolorScheme,
            fontFamily: 'cairo',
            scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            )),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'),
        home: HomeView(),
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl, // Force RTL
            child: child!,
          );
        });
  }
}
