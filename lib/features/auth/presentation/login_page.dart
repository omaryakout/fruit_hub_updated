import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_appBar.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_Field.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import '../../../core/helper_functions/build_error_bar.dart';
import '../../../core/services/get_it.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../../core/widgets/custom_login_button.dart';
import '../../home/main_view.dart';
import '../domain/repos/auth_repo.dart';
import 'cubits/signin_cubit/signin_cubit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });
  static const String routeName = 'loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: SafeArea(
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSucess) {
              buildError(context, 'done');
              Navigator.pushNamed(context, MainView.routeName);
            }
            if (state is SigninFailure) {
              buildError(context, state.message);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: buildAppBar(
                context:   context,title:  'تسجيل الدخول',icon:  Icon(Icons.arrow_back_sharp),function:  () {}),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      autovalidateMode: autovalidateMode,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            onSaved: (input) {
                              email = input!;
                            },
                            keyBoardType: TextInputType.emailAddress,
                            label: Text(
                              'البريد الإلكتروني',
                              style: AppTextStyle.bold13.copyWith(
                                color: Color(0xff949D9E),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextFormField(
                            onSaved: (input) {
                              password = input!;
                            },
                            keyBoardType: TextInputType.emailAddress,
                            label: Text(
                              'كلمة المرور',
                              style: AppTextStyle.bold13.copyWith(
                                color: Color(0xff949D9E),
                              ),
                            ),
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'نسيت كلمة المرور؟',
                                  style: AppTextStyle.semiBold13.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 33,
                          ),
                          CustomButton(
                            text: const Text(
                              'تسجيل دخول',
                              style: AppTextStyle.bold16,
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                _formkey.currentState!.save();
                                context
                                    .read<SigninCubit>()
                                    .signInWithEmailAndPassword(
                                        email, password);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 33,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'لا تمتلك حساب؟',
                                  style: AppTextStyle.semiBold16
                                      .copyWith(color: Color(0xff949D9E)),
                                ),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context, 'SignUpPage');
                                      },
                                    text: 'قم بانشاء حساب',
                                    style: AppTextStyle.semiBold16
                                        .copyWith(color: Color(0xff1B5E37))),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 33,
                          ),
                          CustomDividerWithText(),
                          SizedBox(
                            height: 16,
                          ),
                          CustomLoginButton(
                              text: 'تسجيل بواسطة جوجل',
                              function: () {
                                context.read<SigninCubit>().signInWithGoogle();
                              },
                              icon: Assets.imagesGmail),
                          SizedBox(
                            height: 10,
                          ),
                          CustomLoginButton(
                              text: 'تسجيل بواسطة أبل',
                              function: () {},
                              icon: Assets.imagesApple),
                          SizedBox(
                            height: 10,
                          ),
                          CustomLoginButton(
                              text: 'تسجيل بواسطة فيسبوك',
                              function: () {
                                context
                                    .read<SigninCubit>()
                                    .signInWithFacebook();
                              },
                              icon: Assets.imagesFacebook),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
