class Feed {
  String title;
  String description;
  String urlToImage;
  String publishedAt;
  int rating;

  Feed(this.title, this.description, this.urlToImage, this.publishedAt,
      this.rating);

  static List<Feed> feedList = [
    Feed(
        'Will ‘King Richard’ Earn Will Smith His First Ever-Oscar? The Critics Think So',
        'D irector Reinaldo Marcus Greene’s ‘King Richard’ chronicles Richard Williams’ (Will Smith) efforts to turn his daughters Venus (Saniyya Sidney) and Serena (Demi Singleton) into professional tennis players. The film also stars Aunjanue Ellis, Jon Bernthal and Tony Goldwyn and releases in cinemas across India on Friday, March 25. The film has garnered rave reviews internationally, especially for Smith’s portrayal of the titular character. Smith has already swept awards season and netted Best Actor wins for this role, including at the Golden Globes, BAFTAs and SAGs. Smith is considered a favourite to win at the 94th annual Academy Awards, which takes place on Sunday, March 27. If he does, it will be the actor’s first ever Oscar.',
        'assets/1.jpg',
        '19 hours ago',
        270),
    Feed(
        'Holmes Hurtles Past The Point Of No-Return In ‘The Dropout',
        'T     holmes Hurtles Past The Point Of No-Return In ‘The Dropout’By Mohana Soman 22 March, 2022 2 min readhe Dropout’ starring Amanda Seyfried, Naveen Andrews and Stephen Fry chronicles the rise and fall of former Silicon Valley big shot, Elizabeth Holmes. Holmes, founder and CEO of the now defunct health-tech company Theranos, has been convicted on multiple counts of fraud. You can read our recap of episodes 1-3 here, and our recap of episode four here. Set three years after the events of episode three, episode four shows the aftermath of the Walgreens-Theranos partnership. While Walgreens and its executives were ecstatic when the deal was struck, by the end of year three they no longer shared the same enthusiasm. Holmes receives an ultimatum: Theranos’ device must be available for launch by September that year, or everything goes bust.',
        'assets/2.jpg',
        '1 day ago',
        962),
    Feed(
        'Video: Everything You Need To Know About S. S. Rajamouli’s ‘RRR’',
        'D irector S.S.Rajamouli’s grandest project, ‘RRR’, will release in theatres on March 25. Starring Ram Charan, Jr. NTR, Alia Bhatt, Olivia Morris and Ajay Devgn, the film is set in the 1920s. It traces the journey of two freedom fighters as they battle against British and the Nizam of Hyderabad for a free India. Before you catch this epic film in theatres, here are a few interesting facts',
        'assets/3.jpg',
        '3 days ago',
        632),
    Feed(
        'Trailer: Ajay Devgn’s ‘Runway-34’ Shows That What Rises, Must Fall',
        'T he drama-mystery ‘Runway-34’, is a dramatised retelling of the 2015 Jet Airways case, in which a plane enroute to Kochi from Doha escaped certain destruction in poor weather. The film stars Ajay Devgn, Amitabh Bachchan and Rakul Preet Singh in key roles, and has been directed by Devgn himself. The trailer of ‘Runway 34’ introduces us to Captain Vikrant Khanna (Ajay Devgn), a pilot with a devil-may-care attitude. His brassiness gets him into trouble when he lands his aircraft despite poor visibility',
        'assets/4.jpg',
        '5 days ago',
        802),
    Feed(
        ' Kamala Khan Finishes Homework Before She Saves The World In ‘Ms Marvel’',
        'M s Marvel’, the latest in the line of Marvel’s next-gen superhero series, will be available for streaming on Disney+ Hotstar from June 8. A coming-of-age story with a superhero twist, the six-episode series serves as the origin story of a young Muslim American-Pakistani girl named Kamala Khan (Iman Vellani), who discovers that she has powers just like her hero, Carol Danvers aka Captain Marvel (Brie Larson). The series also stars Aramis Knight, Mohan Kapoor, Zenobia Shroff, Matt Lintz, Rish Shah and Saagar Shaikh in principal roles. The trailer of the show, set to the ultra catchy ‘Blinding Lights’ by The Weeknd, introduces us to Kamala, a typical teenager. Shy and awkward, she yearns to fit in, but is often lost in her dreams, which mostly consist of having superpowers and being an Avenger. Everyone, from her parents to her guidance counsellor tell her to return to reality, because she’s just a normal kid.',
        'assets/5.jpg',
        '19 days ago',
        112)
  ];

}



// List<Feed> get getFeeds {
//   List<Feed> feedList = [
//     Feed(
//         'Will ‘King Richard’ Earn Will Smith His First Ever-Oscar? The Critics Think So',
//         'D irector Reinaldo Marcus Greene’s ‘King Richard’ chronicles Richard Williams’ (Will Smith) efforts to turn his daughters Venus (Saniyya Sidney) and Serena (Demi Singleton) into professional tennis players. The film also stars Aunjanue Ellis, Jon Bernthal and Tony Goldwyn and releases in cinemas across India on Friday, March 25. The film has garnered rave reviews internationally, especially for Smith’s portrayal of the titular character. Smith has already swept awards season and netted Best Actor wins for this role, including at the Golden Globes, BAFTAs and SAGs. Smith is considered a favourite to win at the 94th annual Academy Awards, which takes place on Sunday, March 27. If he does, it will be the actor’s first ever Oscar.',
//         'assets/1.jpg',
//         '19 hours ago',
//         270),
//     Feed(
//         'Holmes Hurtles Past The Point Of No-Return In ‘The Dropout',
//         'T     holmes Hurtles Past The Point Of No-Return In ‘The Dropout’By Mohana Soman 22 March, 2022 2 min readhe Dropout’ starring Amanda Seyfried, Naveen Andrews and Stephen Fry chronicles the rise and fall of former Silicon Valley big shot, Elizabeth Holmes. Holmes, founder and CEO of the now defunct health-tech company Theranos, has been convicted on multiple counts of fraud. You can read our recap of episodes 1-3 here, and our recap of episode four here. Set three years after the events of episode three, episode four shows the aftermath of the Walgreens-Theranos partnership. While Walgreens and its executives were ecstatic when the deal was struck, by the end of year three they no longer shared the same enthusiasm. Holmes receives an ultimatum: Theranos’ device must be available for launch by September that year, or everything goes bust.',
//         'assets/2.jpg',
//         '1 day ago',
//         962),
//     Feed(
//         'Video: Everything You Need To Know About S. S. Rajamouli’s ‘RRR’',
//         'D irector S.S.Rajamouli’s grandest project, ‘RRR’, will release in theatres on March 25. Starring Ram Charan, Jr. NTR, Alia Bhatt, Olivia Morris and Ajay Devgn, the film is set in the 1920s. It traces the journey of two freedom fighters as they battle against British and the Nizam of Hyderabad for a free India. Before you catch this epic film in theatres, here are a few interesting facts',
//         'assets/3.jpg',
//         '3 days ago',
//         632),
//     Feed(
//         'Trailer: Ajay Devgn’s ‘Runway 34’ Shows That What Rises, Must Fall',
//         'T he drama-mystery ‘Runway 34’, is a dramatised retelling of the 2015 Jet Airways case, in which a plane enroute to Kochi from Doha escaped certain destruction in poor weather. The film stars Ajay Devgn, Amitabh Bachchan and Rakul Preet Singh in key roles, and has been directed by Devgn himself. The trailer of ‘Runway 34’ introduces us to Captain Vikrant Khanna (Ajay Devgn), a pilot with a devil-may-care attitude. His brassiness gets him into trouble when he lands his aircraft despite poor visibility',
//         'assets/4.jpg',
//         '5 days ago',
//         802),
//     Feed(
//         ' Kamala Khan Finishes Homework Before She Saves The World In ‘Ms Marvel’',
//         'M s Marvel’, the latest in the line of Marvel’s next-gen superhero series, will be available for streaming on Disney+ Hotstar from June 8. A coming-of-age story with a superhero twist, the six-episode series serves as the origin story of a young Muslim American-Pakistani girl named Kamala Khan (Iman Vellani), who discovers that she has powers just like her hero, Carol Danvers aka Captain Marvel (Brie Larson). The series also stars Aramis Knight, Mohan Kapoor, Zenobia Shroff, Matt Lintz, Rish Shah and Saagar Shaikh in principal roles. The trailer of the show, set to the ultra catchy ‘Blinding Lights’ by The Weeknd, introduces us to Kamala, a typical teenager. Shy and awkward, she yearns to fit in, but is often lost in her dreams, which mostly consist of having superpowers and being an Avenger. Everyone, from her parents to her guidance counsellor tell her to return to reality, because she’s just a normal kid.',
//         'assets/5.jpg',
//         '19 days ago',
//         112)
//   ];

//   return feedList;
// }

incRating(String urlToImage) {}
