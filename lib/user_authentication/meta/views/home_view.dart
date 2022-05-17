import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/movie_buzz/feed/feed_page.dart';
import 'package:movie_booking_app/movie_management/screens/home_screen/tabs/home_tab/home_tab.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/user_notifier.dart';
import 'package:movie_booking_app/user_authentication/core/services/firebase_auth_service.dart';
import 'package:movie_booking_app/user_authentication/meta/views/pick_city_view.dart';
import 'package:movie_booking_app/user_authentication/meta/views/user_settings_view.dart';
import 'package:provider/provider.dart';

import '../../../movie_buzz/movie-quiz/question_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isLoading = true;
  int _selectedIndex = 0;
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final user =
          Provider.of<FirebaseAuthService>(context, listen: false).user;
      if (await Provider.of<UserNotifier>(context, listen: false)
              .getUserInfoFromDB(user) ==
          true) {
        setState(() {
          _isLoading = false;
        });
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PickCityView(
            option: 0,
          ),
        ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserNotifier>(context);
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: kprimaryColor,
              title: ListTile(
                title: const Text(
                  "HII User",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PickCityView(
                        option: 1,
                      ),
                    ));
                  },
                  child: Text(
                    userProvider.user.location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  key: const ValueKey("ProfileButton"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserSettingsView(),
                    ));
                  },
                  icon: const Icon(
                    Icons.person,
                  ),
                ),
              ],
            )
          : AppBar(
            backgroundColor: kprimaryColor,
              title: const ListTile(
                title: Text(
                  "BUZZ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Discover what's trending in entertainment",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('upcoming');
                    },
                    icon: const Icon(Icons.movie)),
                IconButton(
                    onPressed: () {
                      Provider.of<QuestionController>(context, listen: false)
                          .resetQuestionNo();
                      Navigator.of(context).pushNamed('movieQuizNamePage');
                    },
                    icon: const Icon(Icons.quiz)),
              ],
            ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _selectedIndex == 0
              ? const HomeTab()
              : const FeedPage(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(icon: Icon(EvaIcons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.speaker), label: "buzz")
        ],
        currentIndex: _selectedIndex,
        onTap: (int cur) {
          setState(() {
            _selectedIndex = cur;
          });
        },
      ),
    );
  }
}
