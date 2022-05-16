import 'package:flutter/material.dart';
import 'package:movie_booking_app/movie_buzz/model/movieQuizModel.dart';
import 'package:provider/provider.dart';

import '../movie-quiz/question_controller.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const QuestionCard(this.question,this.homePageContext);

  final MovieQuizModel question;
  final BuildContext homePageContext;

  @override
  Widget build(BuildContext context) {
    final questionController =
        Provider.of<QuestionController>(context, listen: false);
    double kDefaultPadding = 10;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.teal,fontSize: 25),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.op.length,
            (index) => Option(question.op[index], index, () {
              questionController.checkAns(question, index, context);
            }, question.ans),
          ),
        ],
      ),
    );
  }
}
