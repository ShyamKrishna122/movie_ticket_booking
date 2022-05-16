import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/movie_buzz/feed/feedPage.dart';
import 'package:movie_booking_app/streams/screens/dashboard_screen.dart';
import 'package:movie_booking_app/streams/screens/movie_details_screen.dart';
import 'package:movie_booking_app/user_authentication/app/providers.dart';
import 'package:movie_booking_app/user_authentication/app/routes/app.routes.dart';
import 'package:movie_booking_app/user_authentication/app/shared/themes.dart';
import 'package:movie_booking_app/user_authentication/meta/views/decider_view.dart';
import 'package:provider/provider.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: remoteProviders,
      child: const Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeciderView(),
      routes: routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
    );
  }
}
