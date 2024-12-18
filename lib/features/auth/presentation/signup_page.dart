import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_Field.dart';
import 'package:fruits_hub/core/widgets/custom_appBar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_check_box.dart';
import 'package:fruits_hub/core/widgets/custom_divider.dart';
import 'package:fruits_hub/core/widgets/custom_login_button.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo_imp.dart';
import 'package:fruits_hub/features/auth/presentation/signup_consumer.dart';
import 'package:get_it/get_it.dart';
import 'package:fruits_hub/core/services/get_it.dart';
import 'package:fruits_hub/features/auth/presentation/sign_up_view_page.dart';
import '../../../core/helper_functions/build_error_bar.dart';
import '../../../core/services/firebase_auth.dart';
import '../domain/repos/auth_repo.dart';
import 'cubits/signup_cubit/signup_cubit.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  static const String routeName = 'SignUpPage';
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit( getIt<AuthRepo>()),
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(
             context:  context, title: 'حساب جديد',icon:  const Icon(Icons.arrow_back_rounded),function:  () {
            Navigator.of(context).pop();
          }),
          body: ConsumerBlocSignUp(),
        ),
      ),
    );
  }
}

