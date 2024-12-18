import 'dart:developer';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/shared_pref_singleton.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl(
      {required this.fireBaseAuthService, required this.dataBaseService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await fireBaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(uid: user.uid, email: email, name: name);
      await addData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await fireBaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        ' ${e.toString()}',
      );
      if (user != null) {
        await fireBaseAuthService.deleteUser();
      }
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInUserWithEmailAndPassword(
      String email, String password) async {
    User? user;
    try {
      user = await fireBaseAuthService.signInUserWithEmailAndPassword(
          email: email, password: password);

      var userEntity3 = await getUserData(uid: user.uid);
      await saveData(user: userEntity3);
      return right(userEntity3);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        ' ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User user;
    try {
      var user = await fireBaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isSigned = await dataBaseService.isUserSigned(
          path: 'users', documentId: user.uid);
      if (isSigned) {
        var userEntity3 = await getUserData(uid: user.uid);
        print('signed');
      } else {
        await addData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await fireBaseAuthService.deleteUser();
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User user;
    try {
      var user = await fireBaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isSigned = await dataBaseService.isUserSigned(
          path: 'users', documentId: user.uid);
      if (isSigned) {
        var userEntity3 = await getUserData(uid: user.uid);
      } else {
        await addData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await fireBaseAuthService.deleteUser();
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future addData({required UserEntity user}) async {
    await dataBaseService.addData(
        path: 'users',
        data: UserModel.fromUserEntity(user).toMap(),
        documentId: user.uid);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData =
        await dataBaseService.getData(path: 'users', documentId: uid);
    print(userData);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveData({required UserEntity user}) async {
    var json = jsonEncode(UserModel.fromUserEntity(user).toMap());
    print(json);
    await SharedPreferencesSSingleton.setString(' test1 ', json);
  }
}
