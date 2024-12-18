import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_Field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'cubits/signup_cubit/signup_cubit.dart';
import 'package:flutter/foundation.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_check_box.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
 late bool signUpBool = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, passWord;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (input) {
                  name = input!;
                },
                keyBoardType: TextInputType.name,
                label: Text('الاسم كامل'),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (input) {
                  email = input!;
                },
                keyBoardType: TextInputType.name,
                label: Text('البريد الإلكتروني'),
              ),
              const SizedBox(
                height: 16,
              ),
              PassWordField(
                onSaved: (input) {
                  passWord = input!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Transform.translate(
                    offset: Offset(0, -4),
                    child: CustomCheckBox(
                      isChecked: signUpBool,
                      passData: (val) {
                        setState(() {
                          signUpBool = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'من خلال إنشاء حساب ، فإنك توافق على',
                              style: AppTextStyle.semiBold13
                                  .copyWith(color: Color(0xff949D9E))),
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '');
                                },
                              text: ' الشروط والأحكام الخاصة بنا',
                              style: AppTextStyle.semiBold13
                                  .copyWith(color: Color(0xff2D9F5D))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 54,
                child: CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (signUpBool) {
                          context
                              .read<SignupCubit>()
                              .createEmailWithUserAndPassWord(
                                  email, passWord, name);
                        } else {
                          buildError(
                              context, 'برجاء الموافقة علي الشروط والأحكام');
                        }
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    text: Text(
                      'إنشاء حساب جديد',
                      style: AppTextStyle.bold16
                          .copyWith(color: Color(0xffFFFFFF)),
                    )),
              ),
              SizedBox(
                height: 26,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'تمتلك حساب بالفعل؟ ',
                        style: AppTextStyle.semiBold13
                            .copyWith(color: Color(0xff949D9E))),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                        text: '  تسجيل دخول',
                        style: AppTextStyle.semiBold13
                            .copyWith(color: Color(0xff2D9F5D))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
