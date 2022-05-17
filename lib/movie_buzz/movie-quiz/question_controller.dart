import 'package:flutter/material.dart';

import '../feed/feed_page.dart';
import '../model/movie_quiz_model.dart';

// We use get package for our state management

class QuestionController extends ChangeNotifier {
  // Lets animated our progress bar

  int _movieIndex = 0;
  setMovieIndex(int i) {
    _movieIndex = i;
    notifyListeners();
  }

  int get getMovieIndex => _movieIndex;
  late Animation _animation;
  // so that we can access our animation outside
  Animation get animation => _animation;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  final List<MovieQuizModel> _questions = MovieQuizModel.movieQuizList
      .map(
        (question) => MovieQuizModel(
            question.questionNo, question.question, question.op, question.ans),
      )
      .toList();

  final List<MovieQuizModel> _questions2 = MovieQuizModel.movieQuizList2
      .map(
        (question) => MovieQuizModel(
            question.questionNo, question.question, question.op, question.ans),
      )
      .toList();

  List<MovieQuizModel> get questions1 => _questions;
  List<MovieQuizModel> get questions2 => _questions2;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  // for more about obs please check documentation
  // int _questionNumber = ;
  // int get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  int _questionNo = 1;
  int get questionNo => _questionNo;
  void resetQuestionNo() {
    _questionNo = 1;
    _selectedAns = 0;
    _isAnswered = false;
    notifyListeners();
  }

  // // called immediately after the widget is allocated memory
  // @override
  // void onInit() {
  //   // Our animation duration is 60 s
  //   // so our plan is to fill the progress bar within 60s
  //   _animationController =
  //       AnimationController(duration: Duration(seconds: 60), vsync: this);
  //   _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
  //     ..addListener(() {
  //       // update like setState
  //       update();
  //     });

  //   // start our animation
  //   // Once 60s is completed go to the next qn
  //   _animationController.forward().whenComplete(nextQuestion);
  //   _pageController = PageController();
  //   super.onInit();
  // }

  // // called just before the Controller is deleted from memory
  // @override
  // void onClose() {
  //   super.onClose();
  //   _animationController.dispose();
  //   _pageController.dispose();
  // }

  void checkAns(
      MovieQuizModel question, int selectedIndex, BuildContext context) {
    // because once user press any option then it will run
    _isAnswered = true;
    if (question.questionNo !=
        ((_movieIndex == 0) ? _questions.length : _questions2.length)) {
      _questionNo += 1;
    }
    _correctAns = question.ans;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    notifyListeners();

    // Once user select an ans after 200 ms it will go to the next qn
    Future.delayed(const Duration(milliseconds: 200), () {
      nextQuestion(question, context);
    });
  }

  void nextQuestion(MovieQuizModel question, BuildContext context) {
    if (question.questionNo != ((_movieIndex == 0) ? _questions.length : _questions2.length)) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);

      // // Reset the counter
      // _animationController.reset();

      // // Then start it again
      // // Once timer is finish go to the next qn
      // _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Quiz results',style: TextStyle(fontSize: 28),),
              content: SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: Text("Score : " +
                      _numOfCorrectAns.toString() +
                      " / " +
                      ((_movieIndex == 0) ? _questions.length : _questions2.length).toString(),style: const TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const FeedPage()),
                          (route) => false);
                    },
                    child: const Text('OK'))
              ],
            );
          });
    }
  }
}
