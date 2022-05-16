import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/personalize_genre_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/personalize_language_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/pick_city_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/user_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/services/firebase_auth_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../movie_buzz/movie-quiz/question_controller.dart';

List<SingleChildWidget> providers = [...remoteProviders];

List<SingleChildWidget> remoteProviders = [
  ChangeNotifierProvider(
    create: (context) => PickCityNotifier(),
  ),
  ChangeNotifierProvider(
    create: (context) => PersonalizeGenreNotifier(),
  ),
  ChangeNotifierProvider(
    create: (context) => PersonalizeLanguageNotifier(),
  ),
  ChangeNotifierProvider(
    create: (context) => UserNotifier(),
  ),
  ChangeNotifierProvider(
    create: (_) => FirebaseAuthService.instance(auth: FirebaseAuth.instance),
  ),
  ChangeNotifierProvider(
    create: (_) => QuestionController(),
  ),
];
