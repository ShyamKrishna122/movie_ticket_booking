class UpcomingMovie{
  String title;
  String path;
  String date;

  UpcomingMovie(this.title,this.date,this.path);

  static List<UpcomingMovie> upcomingMovies = [
    
    UpcomingMovie('Avengers', '19, May 2021', 'assets/6.jpg'),
    UpcomingMovie('Black Widow', '20, May 2021', 'assets/7.jpg'),
    UpcomingMovie('Dolittle', '12, June 2021', 'assets/8.jpg'),
    UpcomingMovie('Mulan', 'May 2022', 'assets/9.jpg'),
    UpcomingMovie('Bad boy', 'March 2022', 'assets/10.jpg'),
    UpcomingMovie('Bad boy', 'July 2022', 'assets/1.jpg'),
    UpcomingMovie('Bad boy', 'July 2022', 'assets/2.jpg'),
    UpcomingMovie('Bad boy', 'July 2022', 'assets/3.jpg'),
    UpcomingMovie('Bad boy', 'July 2022', 'assets/4.jpg'),
    UpcomingMovie('Bad boy', 'July 2022', 'assets/5.jpg'),

  ];
}