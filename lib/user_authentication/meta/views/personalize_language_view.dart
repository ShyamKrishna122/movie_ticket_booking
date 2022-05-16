import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/core/api/firebase_user_info_api.dart';
import 'package:movie_booking_app/user_authentication/meta/views/home_view.dart';
import 'package:provider/provider.dart';

import '../../app/shared/constants.dart';
import '../../core/notifiers/personalize_language_notifier.dart';
import '../../core/notifiers/user_notifier.dart';

class PersonalizeLanguageView extends StatelessWidget {
  const PersonalizeLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personalizeLanguageProvider =
        Provider.of<PersonalizeLanguageNotifier>(context);
    final userProvider = Provider.of<UserNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcanvasColor,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(
                right: kdefaultPadding - 10,
                top: kdefaultPadding,
              ),
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              left: kdefaultPadding,
              top: kdefaultPadding,
            ),
            child: const Text(
              "What Do You Like?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: kdefaultPadding,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: kdefaultPadding,
            ),
            child: const Text(
              "Select a few things you like and we will show you content that will inspire you.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: kdefaultPadding,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (personalizeLanguageProvider.onSelect == true) {
                      personalizeLanguageProvider.toggleLanguages(
                        language: languages[index],
                      );
                    }
                  },
                  onLongPress: () {
                    if (personalizeLanguageProvider.selectedLanguages.isEmpty) {
                      personalizeLanguageProvider.toggleLanguages(
                        language: languages[index],
                      );
                      personalizeLanguageProvider.isLongPressed();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: ListTile(
                      title: Text(
                        languages[index],
                        style: const TextStyle(
                          color: kprimaryColor,
                        ),
                      ),
                      trailing: personalizeLanguageProvider.isLanguageSelected(
                        language: languages[index],
                      )
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: personalizeLanguageProvider
              .selectedLanguages.isNotEmpty
          ? FloatingActionButton(
              onPressed: () async {
                userProvider.setMovieLanguages(
                  movieLanguages: personalizeLanguageProvider.selectedLanguages,
                );
                await FirebaseUserInfoApi(db: FirebaseFirestore.instance)
                    .saveUserInfo(
                  id: userProvider.user.user!.uid,
                  userModel: userProvider.user,
                );
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                    (route) => false);
              },
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            )
          : null,
    );
  }
}
