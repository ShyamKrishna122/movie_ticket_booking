import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'package:movie_booking_app/user_authentication/core/notifiers/personalize_genre_notifier.dart';
import 'package:movie_booking_app/user_authentication/meta/views/personalize_language_view.dart';
import 'package:provider/provider.dart';

import '../../core/notifiers/user_notifier.dart';

class PersonalizeGenersView extends StatelessWidget {
  const PersonalizeGenersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personalizeGenreProvider =
        Provider.of<PersonalizeGenreNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcanvasColor,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PersonalizeLanguageView(),
                ),
              );
            },
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 0.9,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: geners.length,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    InkWell(
                      onTap: () {
                        if (personalizeGenreProvider.onSelect == true) {
                          personalizeGenreProvider.toggleGenre(
                            genre: geners[index],
                          );
                        }
                      },
                      onLongPress: () {
                        if (personalizeGenreProvider.selectedGenres.isEmpty) {
                          personalizeGenreProvider.toggleGenre(
                            genre: geners[index],
                          );
                          personalizeGenreProvider.isLongPressed();
                        }
                      },
                      child: Container(
                        margin: index % 2 == 0 && index != geners.length - 1
                            ? const EdgeInsets.only(
                                left: 10,
                              )
                            : index % 2 != 0 && index != geners.length - 1
                                ? const EdgeInsets.only(
                                    right: 10,
                                  )
                                : index == geners.length - 1
                                    ? const EdgeInsets.only(
                                        bottom: 10,
                                        left: 10,
                                      )
                                    : const EdgeInsets.all(
                                        0,
                                      ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/geners/${geners[index]}",
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (personalizeGenreProvider.isGenreSelected(
                            genre: geners[index]) ==
                        true)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 3,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            Icons.check,
                            size: 14,
                            color: kprimaryColor,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: personalizeGenreProvider.selectedGenres.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                Provider.of<UserNotifier>(context, listen: false)
                    .setMovieGeners(
                  movieGeners: personalizeGenreProvider.selectedGenres,
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PersonalizeLanguageView(),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            )
          : null,
    );
  }
}
