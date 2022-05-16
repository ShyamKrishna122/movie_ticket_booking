import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/movie_buzz/movie-quiz/question_controller.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'package:provider/provider.dart';

class MovieQuizNamePage extends StatelessWidget {
  const MovieQuizNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> movie = ['Avengers', 'Pixar', 'Disney'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Text('Select One '),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onDoubleTap: () {
              Provider.of<QuestionController>(context, listen: false)
                  .setMovieIndex(index);
              Navigator.pushNamed(context, 'movieQuiz');
            },
            child: Card(
              elevation: 4,
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                          child: Container(
                              child: Image.asset(
                        'assets/' + (11 + index).toString() + '.jpg',
                        fit: BoxFit.fill,
                      ))),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Container(
                    child: Container(
                      width: double.infinity,
                      color: Colors.black38,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            child: Text(
                              movie[index],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[400]),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 3,
        // addRepaintBoundaries: true,
      ),
    );
  }
}
