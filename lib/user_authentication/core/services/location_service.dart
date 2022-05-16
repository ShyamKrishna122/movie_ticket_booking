import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/pick_city_notifier.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../notifiers/user_notifier.dart';

class LocationService {
  Future getUserLocation({
    required BuildContext context,
  }) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Utils.snackBar(
        message: 'Location services are disabled.',
        context: context,
      );
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Utils.snackBar(
          message: 'Location permissions are denied',
          context: context,
        );
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Utils.snackBar(
        message:
            'Location permissions are permanently denied, we cannot request permissions.',
        context: context,
      );
      return;
    }

    await Geolocator.getCurrentPosition(
      forceAndroidLocationManager: true,
    ).then((position) async {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        Placemark place = placemarks[0];
        Provider.of<PickCityNotifier>(context, listen: false).setPickedCity(
          cityName: place.subAdministrativeArea!,
        );
        Provider.of<UserNotifier>(context, listen: false).setUserLocation(
          location: place.subAdministrativeArea!,
        );
      } catch (e) {
        Utils.snackBar(
          message: "Something went wrong",
          context: context,
        );
      }
    }).catchError((onError) {
      Utils.snackBar(
        message: "Something went wrong",
        context: context,
      );
    });
  }

  final client = http.Client();
  final headers = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Access-Control-Allow-Origin": '*',
  };

  Future getInfoFromPin({
    required String pincode,
    required BuildContext context,
  }) async {
    try {
      final adressURL = "http://www.postalpincode.in/api/pincode/" + pincode;
      final Uri uri = Uri.parse(adressURL);
      final http.Response response = await client.get(
        uri,
        headers: headers,
      );
      final dynamic body = response.body;
      final Map<String, dynamic> parsedAddress = await jsonDecode(body);
      if (parsedAddress["Status"] == "Success") {
        return parsedAddress;
      } else {
        return {};
      }
    } catch (error) {
      return {};
    }
  }
}
