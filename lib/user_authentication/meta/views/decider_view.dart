import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/routes/app.routes.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/user_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/services/firebase_auth_service.dart';
import 'package:movie_booking_app/user_authentication/meta/views/authentication/login_view.dart';
import 'package:movie_booking_app/user_authentication/meta/views/home_view.dart';
import 'package:movie_booking_app/user_authentication/meta/views/pick_city_view.dart';
import 'package:provider/provider.dart';

class DeciderView extends StatelessWidget {
  // late StreamSubscription<User?>
  //     onAuthChange; //! A stream is declared for listening to an incoming user to the app.
  // //!checks authenticity of user and navigates them to the respective page.
  // @override
  // void initState() {
  //   onAuthChange =
  //       FirebaseAuth.instance.userChanges().listen((user) async {
  //     if (user == null) {
  //       Navigator.of(context).pushReplacementNamed(loginRoute);
  // } else if (await Provider.of<UserNotifier>(context, listen: false)
  //         .getUserInfoFromDB(user) ==
  //     true) {
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     builder: (context) => const HomeView(),
  //   ));
  // } else {
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     builder: (context) => const PickCityView(
  //       option: 0,
  //     ),
  //   ));
  // }
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   onAuthChange.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, FirebaseAuthService user, _) {
        switch (user.status) {
          case Status.Uninitialized:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case Status.Unauthenticated:
            return LoginView();
          case Status.Authenticated:
            return const HomeView();
        }
      },
    );
  }
}
