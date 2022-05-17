import 'package:movie_booking_app/booking_tickets/choose_seat_screen.dart';
import 'package:movie_booking_app/user_authentication/meta/views/authentication/forgot_password_view.dart';

import '../../../booking_tickets/review_screen.dart';
import '../../../movie_buzz/feed/feed_detail.dart';
import '../../../movie_buzz/feed/feed_page.dart';
import '../../../movie_buzz/movie-quiz/movie_name_select.dart';
import '../../../movie_buzz/movie-quiz/movie_quiz.dart';
import '../../../movie_buzz/upcoming_movies/upcoming_movies_list.dart';
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
  ChooseSeatScreen.routeName: (ctx) => const ChooseSeatScreen(),
  ReviewScreen.routeName: (ctx) => const ReviewScreen(),
  MovieDetailsScreen.routeName: (ctx) => const MovieDetailsScreen(),
  'feedPage': (ctx) => const FeedPage(),
  'feedDetail': (ctx) => const FeedDetail(),
  'upcoming': (ctx) => const UpcomingMovieList(),
  'movieQuiz': (ctx) => const MovieQuiz(),
  'movieQuizNamePage': (ctx) => const MovieQuizNamePage(),
};
