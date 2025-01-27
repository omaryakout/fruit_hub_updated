part of 'signup_cubit.dart';

@immutable
class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSucess extends SignupState {
  final UserEntity userEntity;

  SignupSucess({required this.userEntity});
}

class SignupFailure extends SignupState {
  SignupFailure({required this.message});

  final String message;
}
