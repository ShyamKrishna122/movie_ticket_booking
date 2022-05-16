class MovieQuizModel {
  final int questionNo;
  final String question;
  final List<String> op;
  final int ans;

  MovieQuizModel(this.questionNo, this.question, this.op, this.ans);

  static List<MovieQuizModel> movieQuizList = [
    MovieQuizModel(
        1,
        'Who diverts a nuclear missile into a wormhole and defeats the Chitauri army?',
        ['Black Widow', 'The Hulk', 'Iron Man', 'Thor'],
        3),
    MovieQuizModel(
        2,
        'In Avengers: Age of Ultron, what is the name of the villain who wants to destroy Earth?',
        ['Green Goblin', 'Ultron', 'The Penguin ', 'The Joker'],
        1),
    MovieQuizModel(
        3,
        'How does Black Widow turn the Hulk back into Bruce Banner?',
        [
          'By asking politely',
          'With a text message',
          'With a lullaby',
          'With a  special potion'
        ],
        2),
    MovieQuizModel(
        4,
        'Who sells Ultron Vibranium and instantly makes \$1.285 billion?',
        ['Bruce Banner', 'Diana Prince', 'Ulysses Klaue', 'Tony Stark'],
        3),
    MovieQuizModel(5, 'What is Clint Barton\'s superhero name?',
        ['Black Panther', 'Hawkeye', 'Iron Man', 'Thor'], 1),
    MovieQuizModel(
        6,
        'In Avengers: Infinity War, what is the name of the villain who\'s on a mission to collect the infinity stones?',
        ['Malekith', 'Thanos', 'Darren Cross', 'Helmut Demo'],
        1)
  ];

  static List<MovieQuizModel> movieQuizList2 = [
    MovieQuizModel(1, 'Finding Nemo: What is the name of Nemo\'s dad?',
        ['Joe', 'David', 'Kevin', 'Marlin'], 1),
    MovieQuizModel(2, 'Toy Story: What is the name of Andy\'s mean neighbour?',
        ['Jhonny', 'Sid', 'Steve', 'Paul'], 3),
    MovieQuizModel(
        3,
        'Beauty and the Beast: What are these two characters called?',
        [
          'Waxy and Clockman',
          'Lumiere and Cogsworth',
          'Flicker and Tciker',
          'Flame and Tock'
        ],
        0),
    MovieQuizModel(
        4,
        'The LEGO Movie 2: The Second Part: What is Emmet\'s surname? ',
        ['Lago', 'Loggo', 'Smith', 'Brickowski'],
        3),
  ];
}
