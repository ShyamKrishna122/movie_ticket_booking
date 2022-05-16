import 'package:flutter/material.dart';
import 'package:movie_booking_app/movie_buzz/movie-quiz/question_controller.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'package:provider/provider.dart';

import '../model/movieQuizModel.dart';
import '../model/question_card.dart';

class MovieQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QuestionController>(context);
    List<MovieQuizModel> movieList = controller.getMovieIndex == 0
        ? MovieQuizModel.movieQuizList
        : MovieQuizModel.movieQuizList2;
    double kDefaultPadding = 10;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // ElevatedButton(onPressed:(){},child: Text("Skip")),
        ],
      ),
      body: Stack(
        children: [
          // Image.asset("assets/6.jpg", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Container(),
                ),
                SizedBox(height: kDefaultPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    "Question  " +
                        controller.questionNo.toString() +
                        " / " +
                        movieList.length.toString(),
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(thickness: 1.5),
                SizedBox(height: kDefaultPadding),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics: NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    // onPageChanged: controller.,
                    itemCount: movieList.length,
                    itemBuilder: (context, index) =>
                        QuestionCard(movieList[index], context),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
