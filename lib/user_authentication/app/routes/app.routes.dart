import 'package:movie_booking_app/booking_tickets/choose_seat_screen.dart';
import 'package:movie_booking_app/user_authentication/meta/views/authentication/forgot_password_view.dart';

import '../../../booking_tickets/review_screen.dart';
import '../../../booking_tickets/theater_screen.dart';
import '../../../movie_buzz/feed/feedDetail.dart';
import '../../../movie_buzz/feed/feedPage.dart';
import '../../../movie_buzz/movie-quiz/movieNameSelect.dart';
import '../../../movie_buzz/movie-quiz/movieQuiz.dart';
import '../../../movie_buzz/upcoming_movies/upcomingMoviesList.dart';
import '../../../streams/screens/movie_details_screen.dart';
import '../../meta/views/authentication/login_view.dart';
import '../../meta/views/authentication/signup_view.dart';

const String loginRoute = '/login';
const String signUpRoute = '/signUp';
const String requestOtpRoute = '/requestOtp';
const String forgotPasswordRoute = '/forgotPassword';

final routes = {
  loginRoute: (context) => const LoginView(),
  signUpRoute: (context) => const SignUpView(),
  forgotPasswordRoute: (context) => const ForgotPasswordView(),
  TheaterScreen.routeName: (ctx) => const TheaterScreen(),
  ChooseSeatScreen.routeName: (ctx) => const ChooseSeatScreen(),
  ReviewScreen.routeName: (ctx) => const ReviewScreen(),
  MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
  'feedPage': (ctx) => FeedPage(),
  'feedDetail': (ctx) => FeedDetail(),
  'upcoming': (ctx) => const UpcomingMovieList(),
  'movieQuiz': (ctx) => MovieQuiz(),
  'movieQuizNamePage': (ctx) => const MovieQuizNamePage(),
};
