import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/features/auth/presentation/sign_up_view_page.dart';


import 'cubits/signup_cubit/signup_cubit.dart';

class ConsumerBlocSignUp extends StatelessWidget {
  const ConsumerBlocSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSucess) {
          Navigator.pop(context);
        }
        if (state is SignupFailure) {
          print('${state.message}ff');
          buildError(context, state.message);
        }
      },
      builder: (context, state) {
        return 
          
             SignUpViewBody();
      },
    );
  }
}
