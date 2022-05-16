import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  User? user;
  String location;
  List<String>? movieGeners;
  List<String>? movieLanguages;
  String? firstName;
  String? lastName;
  String? pincode;
  String? ad1;
  String? ad2;
  String? landmark;
  String? city;
  String? state;

  UserModel({
    this.user,
    required this.location,
    this.movieGeners,
    this.movieLanguages,
    this.firstName,
    this.lastName,
    this.pincode,
    this.ad1,
    this.ad2,
    this.landmark,
    this.city,
    this.state,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        location: json["location"],
        movieGeners: List<String>.from(json["movieGenres"]).toList(),
        movieLanguages: List<String>.from(json["movieLanguages"]).toList(),
        firstName: json["firstName"],
        lastName: json["lastName"],
        pincode: json["pincode"],
        ad1: json["ad1"],
        ad2: json["ad2"],
        landmark: json["landmark"],
        city: json["city"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "movieGenres": movieGeners,
        "movieLanguages": movieLanguages,
        "firstName": firstName,
        "lastName": lastName,
        "pincode": pincode,
        "ad1": ad1,
        "ad2": ad2,
        "landmark": landmark,
        "city": city,
        "state": state,
      };
}
