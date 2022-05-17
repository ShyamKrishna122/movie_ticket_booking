import 'package:flutter/material.dart';

import '../model/movie.dart';
import '../screens/movie_details_screen.dart';

class VerticalListItem extends StatelessWidget {
  final int index;
  const VerticalListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              MovieDetailsScreen.routeName,
              arguments: {
                'id': bestMovieList[index].id,
                'title': bestMovieList[index].title,
                'imageUrl': bestMovieList[index].imageUrl,
                'description': bestMovieList[index].description,
                'rating': bestMovieList[index].rating,
                'year': bestMovieList[index].year,
                'duration': bestMovieList[index].duration,
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: bestMovieList[index].id,
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          bestMovieList[index].imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bestMovieList[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 240,
                        child: Text(
                          bestMovieList[index].description,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
