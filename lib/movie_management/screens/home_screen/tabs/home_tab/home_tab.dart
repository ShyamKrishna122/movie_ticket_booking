import 'package:flutter/material.dart';

import '../../../../themes/colors.dart';
import 'home_movies.dart';
import 'home_search.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        const HomeSearch(),
        Container(
          width: double.maxFinite,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
          child: const Text(
            'Featured Movies',
            style: TextStyle(
                color: white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        const HomeMovies()
      ],
    );
  }
}
