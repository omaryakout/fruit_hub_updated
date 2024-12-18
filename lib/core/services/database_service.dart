import 'package:flutter/material.dart';

import '../../features/auth/domain/entity/user_entity.dart';

abstract class DataBaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
       String? documentId});
  Future<dynamic> getData(
      {required String path, String? documentId,Map<String,dynamic>?query});
      
  Future<bool> isUserSigned({required String path, required String documentId});
}
