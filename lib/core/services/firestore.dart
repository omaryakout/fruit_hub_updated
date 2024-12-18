import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/features/auth/data/model/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

class FireStoreDataBase implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    await firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    if (documentId != null) {
      try {
        var data = await firestore.collection(path).doc(documentId).get();
        return data.data();
      } catch (e) {
        print(e);
      }
    } else {
      try {
        Query<Map<String, dynamic>> data = firestore.collection(path);
        print(data.snapshots());
        if (query != null) {
          if (query['orderBy'] != null) {
            var orderBy = query['orderBy'];
            var desecding = query['desceding'];
            data = data.orderBy(orderBy, descending: desecding);
            if (query['limit'] != null) {
              var limit = query['limit'];
              data = data.limit(limit);
            }
          }
        }
        var result = await data.get();
        return result.docs
            .map(
              (e) => e.data(),
            )
            .toList();
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Future<bool> isUserSigned(
      {required String path, required String documentId}) async {
    var data = await firestore.collection('users').doc(documentId).get();
    return data.exists;
  }
}
