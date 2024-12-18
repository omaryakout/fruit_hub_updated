import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(
       String email, String password ) async {
    emit(SigninLoading());
    final user =
        await authRepo.signInUserWithEmailAndPassword(email, password );

    user.fold((l) => emit(SigninFailure(message: l.message)),
        (r) => emit(SigninSucess(userEntity: r)));
  }

  Future<void> signInWithGoogle(
      ) async {
    emit(SigninLoading());
    final user =
        await authRepo.signInWithGoogle();

    user.fold((l) => emit(SigninFailure(message: l.message)),
        (r) => emit(SigninSucess(userEntity: r)));
  }

   Future<void> signInWithFacebook(
      ) async {
    emit(SigninLoading());
    final user =
        await authRepo.signInWithFacebook();

    user.fold((l) => emit(SigninFailure(message: l.message)),
        (r) => emit(SigninSucess(userEntity: r)));
  }
}
