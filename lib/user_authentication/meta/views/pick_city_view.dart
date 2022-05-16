import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'package:movie_booking_app/user_authentication/core/api/firebase_user_info_api.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/pick_city_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/services/location_service.dart';
import 'package:movie_booking_app/user_authentication/meta/views/personalize_geners_view.dart';
import 'package:provider/provider.dart';

import '../../core/notifiers/user_notifier.dart';

class PickCityView extends StatefulWidget {
  const PickCityView({
    Key? key,
    required this.option,
  }) : super(key: key);

  final int option;

  @override
  State<PickCityView> createState() => _PickCityViewState();
}

class _PickCityViewState extends State<PickCityView> {
  final TextEditingController _searchCity = TextEditingController();

  @override
  void dispose() {
    _searchCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pickCityProvider = Provider.of<PickCityNotifier>(context);
    final userProvider = Provider.of<UserNotifier>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          _searchCity.text.isNotEmpty && pickCityProvider.searchedCities.isEmpty
              ? null
              : AppBar(
                  backgroundColor: kprimaryColor,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Text(
                    pickCityProvider.pickedCity.isEmpty
                        ? "Pick a city"
                        : pickCityProvider.pickedCity,
                  ),
                ),
      body: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              if (_searchCity.text.isNotEmpty &&
                  pickCityProvider.searchedCities.isEmpty)
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        noResults,
                      ),
                    ),
                  ),
                ),
              if (_searchCity.text.isNotEmpty &&
                  pickCityProvider.searchedCities.isEmpty)
                Positioned(
                  top: 3 * kdefaultPadding + 1,
                  left: kdefaultPadding - 10,
                  right: kdefaultPadding - 10,
                  height: 50,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kdefaultPadding * 0.50,
                    ),
                    decoration: BoxDecoration(
                      color: _searchCity.text.isNotEmpty &&
                              pickCityProvider.searchedCities.isEmpty
                          ? Colors.white
                          : kprimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        color: _searchCity.text.isNotEmpty &&
                                pickCityProvider.searchedCities.isEmpty
                            ? Colors.black
                            : Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Search for your city",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          color: kprimaryColor,
                        ),
                      ),
                      controller: _searchCity,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        pickCityProvider.searchCityByName(
                          cityName: value.trim(),
                        );
                      },
                    ),
                  ),
                ),
              if (_searchCity.text.isEmpty ||
                  pickCityProvider.searchedCities.isNotEmpty)
                Container(
                  height: 50,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kdefaultPadding * 0.50,
                  ),
                  decoration: BoxDecoration(
                    color: _searchCity.text.isNotEmpty &&
                            pickCityProvider.searchedCities.isEmpty
                        ? Colors.white
                        : kprimaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.only(
                    left: kdefaultPadding - 10,
                    right: kdefaultPadding - 10,
                    top: kdefaultPadding,
                    bottom: kdefaultPadding,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: _searchCity.text.isNotEmpty &&
                              pickCityProvider.searchedCities.isEmpty
                          ? Colors.black
                          : Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Search for your city",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: kprimaryColor,
                      ),
                    ),
                    controller: _searchCity,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      pickCityProvider.searchCityByName(
                        cityName: value.trim(),
                      );
                    },
                  ),
                ),
            ],
          ),
          if (_searchCity.text.isEmpty ||
              (_searchCity.text.isNotEmpty &&
                  pickCityProvider.searchedCities.isNotEmpty))
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await LocationService().getUserLocation(
                          context: context,
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const PersonalizeGenersView();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: size.width,
                        margin: const EdgeInsets.only(
                          left: kdefaultPadding,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.pink[400],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Auto Detect My Location",
                              style: TextStyle(
                                color: Colors.pink[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kdefaultPadding + 5,
                    ),
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.only(
                        left: kdefaultPadding,
                        bottom: kdefaultPadding - 5,
                      ),
                      child: const Text(
                        "Popular Cities",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: _searchCity.text.isNotEmpty
                          ? pickCityProvider.searchedCities.length <= 4
                              ? 60
                              : pickCityProvider.searchedCities.length <= 8
                                  ? 120
                                  : pickCityProvider.searchedCities.length >= 8
                                      ? 200
                                      : 200
                          : 200,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1 / 0.7,
                        ),
                        itemCount: _searchCity.text.isNotEmpty
                            ? pickCityProvider.searchedCities.length
                            : pickCityProvider.popularCities.length,
                        itemBuilder: (context, index) {
                          final city = _searchCity.text.isNotEmpty
                              ? pickCityProvider.searchedCities[index]
                              : pickCityProvider.popularCities[index];
                          return InkWell(
                            onTap: () async {
                              pickCityProvider.setPickedCity(
                                cityName: city.cityName,
                              );
                              userProvider.setUserLocation(
                                location: city.cityName,
                              );
                              if (widget.option == 0) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const PersonalizeGenersView();
                                    },
                                  ),
                                );
                              } else {
                                await FirebaseUserInfoApi(
                                        db: FirebaseFirestore.instance)
                                    .updateLocation(
                                  id: userProvider.user.user!.uid,
                                  userModel: userProvider.user,
                                );
                                Navigator.of(context).pop();
                              }
                            },
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Column(
                                children: [
                                  Icon(
                                    city.icon,
                                    size: 26,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    city.cityName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: kdefaultPadding + 5,
                    ),
                    Container(
                      width: size.width,
                      margin: const EdgeInsets.only(
                        left: kdefaultPadding,
                        bottom: kdefaultPadding - 5,
                      ),
                      child: const Text(
                        "Other Cities",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: _searchCity.text.isNotEmpty
                          ? 47.0 * pickCityProvider.searchedCities.length
                          : 47.0 * pickCityProvider.popularCities.length,
                      child: ListView.builder(
                        itemExtent: 47,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _searchCity.text.isNotEmpty
                            ? pickCityProvider.searchedCities.length
                            : pickCityProvider.popularCities.length,
                        itemBuilder: (context, index) {
                          final city = _searchCity.text.isNotEmpty
                              ? pickCityProvider.searchedCities[index]
                              : pickCityProvider.popularCities[index];
                          return Container(
                            color: kprimaryColor.withOpacity(0.05),
                            child: ListTile(
                              onTap: () async {
                                pickCityProvider.setPickedCity(
                                  cityName: city.cityName,
                                );
                                userProvider.setUserLocation(
                                  location: city.cityName,
                                );
                                if (widget.option == 0) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const PersonalizeGenersView();
                                      },
                                    ),
                                  );
                                } else {
                                  await FirebaseUserInfoApi(
                                          db: FirebaseFirestore.instance)
                                      .updateLocation(
                                    id: userProvider.user.user!.uid,
                                    userModel: userProvider.user,
                                  );
                                  Navigator.of(context).pop();
                                }
                              },
                              title: Text(
                                city.cityName,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              trailing:
                                  pickCityProvider.pickedCity == city.cityName
                                      ? Container(
                                          height: 10,
                                          width: 10,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                          ),
                                        )
                                      : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
