import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_booking_app/user_authentication/core/models/user_model.dart';

class FirebaseUserInfoApi {
  const FirebaseUserInfoApi({required this.db});

  final FirebaseFirestore db;
  Future saveUserInfo({
    required String id,
    required UserModel userModel,
  }) async {
    return await db.collection("Users").doc(id).set(userModel.toJson());
  }

  Future updateLocation({
    required String id,
    required UserModel userModel,
  }) async {
    return await db.collection("Users").doc(id).update({
      'location': userModel.location,
    });
  }

  Future updateuserInfo({required UserModel userModel}) async {
    return await db
        .collection("Users")
        .doc(userModel.user!.uid)
        .update(userModel.toJson());
  }

  Future getUserInfoFromDB({
    required String id,
  }) async {
    final value = await db.collection("Users").doc(id).get();
    return value;
  }
}
