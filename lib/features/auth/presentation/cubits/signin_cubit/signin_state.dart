part of 'signin_cubit.dart';

@immutable
class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSucess extends SigninState {
  final UserEntity userEntity;
  SigninSucess({required this.userEntity});
}

class SigninFailure extends SigninState {
  final String message;
  SigninFailure({required this.message});
}
