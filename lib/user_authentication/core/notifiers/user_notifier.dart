import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/core/api/firebase_user_info_api.dart';
import 'package:movie_booking_app/user_authentication/core/models/user_model.dart';

class UserNotifier extends ChangeNotifier {
  UserModel _user = UserModel(
    location: "",
  );

  UserModel get user => _user;

  void setUserModel({required UserModel userModel}) {
    _user = userModel;
    notifyListeners();
  }

  void setUserData({
    required User? user,
  }) {
    _user.user = user;
    notifyListeners();
  }

  void setUserLocation({
    required String location,
  }) {
    _user.location = location;
    notifyListeners();
  }

  void setMovieGeners({
    required List<String> movieGeners,
  }) {
    _user.movieGeners = movieGeners;
    notifyListeners();
  }

  void setMovieLanguages({
    required List<String> movieLanguages,
  }) {
    _user.movieLanguages = movieLanguages;
    notifyListeners();
  }

  setOtherData(UserModel userModel) {
    _user.firstName = userModel.firstName;
    _user.lastName = userModel.lastName;
    _user.pincode = userModel.pincode;
    _user.landmark = userModel.landmark;
    _user.ad1 = userModel.ad1;
    _user.ad2 = userModel.ad2;
    _user.city = userModel.city;
    _user.state = userModel.state;
    notifyListeners();
  }

  Future<bool> getUserInfoFromDB(User? user) async {
    var temp = false;
    setUserData(
      user: user,
    );
    final value = await FirebaseUserInfoApi(db: FirebaseFirestore.instance)
        .getUserInfoFromDB(id: user!.uid);
    if (value.exists) {
      UserModel userModel = UserModel.fromJson(
        value.data()!,
      );
      setOtherData(
        userModel,
      );
      setUserLocation(
        location: userModel.location,
      );
      setMovieGeners(
        movieGeners: userModel.movieGeners!,
      );
      setMovieLanguages(
        movieLanguages: userModel.movieLanguages!,
      );
      temp = true;
    }
    return temp;
  }
}
