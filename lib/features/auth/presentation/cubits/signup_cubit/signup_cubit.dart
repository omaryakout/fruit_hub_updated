import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:meta/meta.dart';
import '../../../../../core/services/firebase_auth.dart';
import '../../../domain/repos/auth_repo.dart';
import '../../../domain/repos/auth_repo_imp.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  AuthRepo authRepo;
  Future<void> createEmailWithUserAndPassWord(
      String email, String password, String name) async {
    emit(SignupLoading());

    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold((l) => emit(SignupFailure(message: l.message)),
        (r) => emit(SignupSucess(userEntity: r)));
  }
}
