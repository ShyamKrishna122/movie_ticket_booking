import 'package:flutter/material.dart';

import '../model/upcomingMovie.dart';

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming movies'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final movie = UpcomingMovie.upcomingMovies[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            shadowColor: Colors.black87,
            color: Colors.black87,
            child: Stack(children: <Widget>[
              Container(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(movie.path))),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                    width: double.infinity,
                    color: Colors.black54,
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: Text(
                      movie.date,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                    )),
              ]),
            ]),
          );
        },
        itemCount: UpcomingMovie.upcomingMovies.length,
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:ticketbookingflutter/movie_buzz/model/upcomingMovie.dart';

// class UpcomingMovieList extends StatelessWidget {
//   const UpcomingMovieList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upcoming movies'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.7,
//           mainAxisSpacing: 20,
//           crossAxisSpacing: 20,
//         ),
//         itemBuilder: (context, index) {
//           final movie = UpcomingMovie.upcomingMovies[index];
//           return Expanded(
//             child: Column(
//               children: [
//                 Container(
//                   height: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(movie.path),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Text(movie.title),
//                 Text(movie.date)
//               ],
//             ),
//           );
//         },
//         itemCount: UpcomingMovie.upcomingMovies.length,
//       ),
//     );
//   }
// }
