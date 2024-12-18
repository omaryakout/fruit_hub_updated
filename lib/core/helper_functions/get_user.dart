import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/services/shared_pref_singleton.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';

import '../../features/auth/domain/entity/user_entity.dart';

UserEntity getUser() {
  var json = SharedPreferencesSSingleton.getString(' test1 ');
  print(json);
  var userData = UserModel.fromJson(jsonDecode(json));

  return userData;
}
