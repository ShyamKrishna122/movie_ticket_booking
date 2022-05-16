import 'package:flutter/material.dart';

import '../models/city_model.dart';

class PickCityNotifier extends ChangeNotifier {
  String _pickedCity = "";

  final List<CityModel> _popularCities = [
    CityModel(icon: Icons.location_city, cityName: "Mumbai"),
    CityModel(icon: Icons.location_city, cityName: "Delhi"),
    CityModel(icon: Icons.location_city, cityName: "Bengaluru"),
    CityModel(icon: Icons.location_city, cityName: "Hyderabad"),
    CityModel(icon: Icons.location_city, cityName: "Chandigarh"),
    CityModel(icon: Icons.location_city, cityName: "Ahmedabad"),
    CityModel(icon: Icons.location_city, cityName: "Pune"),
    CityModel(icon: Icons.location_city, cityName: "Chennai"),
    CityModel(icon: Icons.location_city, cityName: "Kolkata"),
    CityModel(icon: Icons.location_city, cityName: "Kochi"),
  ];

  List<CityModel> _searchedCities = [];

  void setPickedCity({
    required String cityName,
  }) {
    _pickedCity = cityName;
    notifyListeners();
  }

  String get pickedCity => _pickedCity;

  void searchCityByName({
    required String cityName,
  }) {
    _searchedCities = _popularCities
        .where((element) => element.cityName.contains(cityName))
        .toList();
    notifyListeners();
  }

  List<CityModel> get searchedCities => _searchedCities;
  List<CityModel> get popularCities => _popularCities;
}
