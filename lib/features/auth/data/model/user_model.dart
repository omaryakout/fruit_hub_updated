import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/core/services/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.uid, required super.email, required super.name});
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        uid: user.uid, email: user.email ?? '', name: user.displayName ?? '');
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'], email: json['email'], name: json['name']);
  }

  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
        uid: userEntity.uid, email: userEntity.email, name: userEntity.name);
  }

  toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}
