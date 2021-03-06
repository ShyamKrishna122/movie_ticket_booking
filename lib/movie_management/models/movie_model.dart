import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieModel {
  final String? title;
  final String? image;
  final Icon? icon;
  final String? ratingNumber;
  final String? directorName;
  final String? writerName;
  final String? description;
  final Map<String, String>? weekDays;
  final List<String>? showTime;
  final Map<int, int>? reservedSeat;
  final double? price;

  MovieModel({
    this.title,
    this.image,
    this.icon,
    this.ratingNumber,
    this.directorName,
    this.writerName,
    this.description,
    this.weekDays,
    this.showTime,
    this.reservedSeat,
    this.price,
  });
}

List<MovieModel> movieDataList = [
  MovieModel(
      title: 'Red Notice',
      image: 'assets/images/rednotice.jpg',
      ratingNumber: '8.8',
      description:
          'Red Notice is a 2021 American action comedy film written, directed, and produced by Rawson Marshall Thurber. Dwayne Johnson, who also served as a producer, stars as an FBI agent who reluctantly teams up with a renowned art thief (Ryan Reynolds) in order to catch an even more notorious criminal (Gal Gadot). The film marks the third collaboration between Thurber and Johnson, following Central Intelligence (2016) and Skyscraper (2018).',
      directorName: 'Rawson Marshall Thurber',
      writerName: 'Rawson Marshall Thurber',
      weekDays: {
        'Sun': '1',
        'Mon': '2',
        'Tue': '3',
        'Wed': '4',
        'Fri': '6',
        'Sat': '7'
      },
      showTime: ['10:00 AM', '12:30 PM', '3:00 PM', '6:00 PM', '9:00 PM'],
      reservedSeat: {1: 13, 2: 24, 3: 34, 4: 35, 5: 47, 6: 50, 7: 19},
      price: 75),
  MovieModel(
      title: 'Army of Thieves',
      image: 'assets/images/armyofthieves.jpg',
      ratingNumber: '8.1',
      description:
          'Army of Thieves is a 2021 heist comedy film directed by Matthias Schweighöfer from a screenplay by Shay Hatten, based on a story he wrote with Zack Snyder. A prequel to Army of the Dead, it is the second installment in the Army of the Dead franchise; the film stars Schweighöfer, who reprises his role as Ludwig Dieter, alongside a supporting cast that includes Nathalie Emmanuel, Ruby O. Fee, Stuart Martin, Guz Khan, and Jonathan Cohen.',
      directorName: 'Matthias Schweighöfer',
      writerName: 'Zack Snyder and Shay Hatten',
      weekDays: {'Sun': '1', 'Tue': '3', 'Wed': '4', 'Fri': '6', 'Sat': '7'},
      showTime: ['10:00 AM', '1:00 PM', '5:00 PM', '8:00 PM'],
      reservedSeat: {1: 12, 2: 23, 3: 33, 4: 3, 5: 47, 6: 50, 7: 18},
      price: 40),
  MovieModel(
      title: 'Xtreme',
      image: 'assets/images/xtreme.jpg',
      ratingNumber: '8.2',
      description:
          'Xtreme (Spanish: Xtremo) is a 2021 Spanish action thriller and martial arts film directed by Daniel Benmayor, written by Teo García, Iván Ledesma and Genaro Rodríguez and starring Teo García, Óscar Jaenada, Sergio Peris-Mencheta and Óscar Casas',
      directorName: 'Daniel Benmayor',
      writerName: 'Teo García, Iván Ledesma and Genaro Rodríguez',
      weekDays: {'Sun': '1', 'Wed': '4', 'Fri': '6', 'Sat': '7'},
      showTime: ['10:30 AM', '1:00 PM', '5:00 PM', '8:00 PM'],
      reservedSeat: {
        1: 10,
        2: 20,
        3: 23,
        4: 13,
        5: 49,
        6: 50,
      },
      price: 35),
  MovieModel(
      title: 'The Tomorrow War',
      image: 'assets/images/tomorowar.jpg',
      ratingNumber: '8.4',
      description:
          'The Tomorrow War is a 2021 American military science fiction action film directed by Chris McKay. The picture is produced by David Ellison, Dana Goldberg, Don Granger, David S. Goyer, Jules Daly, and Adam Kolbrenner, and written by Zach Dean. The ensemble cast features Chris Pratt, Yvonne Strahovski, J. K. Simmons, Betty Gilpin, Sam Richardson, Edwin Hodge, Jasmine Mathews, Ryan Kiera Armstrong, and Keith Powers. It follows a mix of present-day soldiers and civilians sent into the future to fight an alien army.',
      directorName: 'Chris McKay',
      writerName: 'Zach Dean',
      weekDays: {
        'Sun': '1',
        'Mon': '2',
        'Tue': '3',
        'Wed': '4',
        'Fri': '6',
      },
      showTime: ['10:45 AM', '1:00 PM', '3:30 PM', '6:00 PM', '8:30 PM'],
      reservedSeat: {1: 9, 2: 25, 3: 36, 4: 37, 5: 49, 6: 50, 7: 18},
      price: 65),
  MovieModel(
      title: 'Sweet Girl',
      image: 'assets/images/sweetgirl.jpg',
      ratingNumber: '8.3',
      description:
          'Sweet Girl is a 2021 American action thriller film directed by Brian Andrew Mendoza in his feature directorial debut and written by Philip Eisner and Gregg Hurwitz. The film stars Jason Momoa, Isabela Merced, Manuel Garcia-Rulfo, Adria Arjona, Raza Jaffrey, Justin Bartha, Lex Scott Davis, Michael Raymond-James and Amy Brenneman.',
      directorName: 'Brian Andrew Mendoza',
      writerName: 'Philip Eisner and Gregg Hurwitz',
      weekDays: {'Mon': '2', 'Tue': '3', 'Wed': '4', 'Fri': '6', 'Sat': '7'},
      showTime: ['10:00 AM', '12:30 PM', '3:30 PM', '6:00 PM', '8:15 PM'],
      reservedSeat: {1: 5, 2: 6, 3: 13, 4: 18, 5: 49, 6: 50, 7: 12},
      price: 45),
  MovieModel(
      title: 'The Unforgiveable',
      image: 'assets/images/unforgiveable.jpg',
      ratingNumber: '8.6',
      description:
          'The Unforgivable is a 2021 drama film directed by Nora Fingscheidt and written by Peter Craig, Hillary Seitz and Courtenay Miles,[2] based on the 2009 British miniseries Unforgiven written by Sally Wainwright. The film stars Sandra Bullock as a woman who attempts to rebuild her life after serving time in prison for committing a violent crime. It also stars Vincent D\'Onofrio, Jon Bernthal, Viola Davis, Richard Thomas, Linda Emond, Aisling Franciosi, Rob Morgan.',
      directorName: 'Nora Fingscheidt',
      writerName: 'Peter Craig, Hillary Seitz and Courtenay Miles',
      showTime: ['10:00 AM', '12:30 PM', '3:00 PM', '5:30 PM', '8:00 PM'],
      reservedSeat: {1: 6, 2: 10, 3: 39, 4: 43, 5: 44, 6: 50, 7: 51},
      price: 70),
  MovieModel(
      title: 'Night Books',
      image: 'assets/images/nightbooks.jpg',
      ratingNumber: '8.2',
      description:
          'Nightbooks is a 2021 American dark fantasy film directed by David Yarovesky and written by Mikki Daughtry and Tobias Iaconis. The film stars Winslow Fegley, Lidya Jewett, and Krysten Ritter. Based on the 2018 horror-fantasy children\'s book of the same name by J. A. White, it was released September 15, 2021, on Netflix.',
      directorName: 'David Yarovesky',
      writerName: 'Mikki Daughtry and Tobias Iaconis',
      weekDays: {
        'Sun': '1',
        'Mon': '2',
        'Tue': '3',
        'Wed': '4',
        'Fri': '6',
        'Sat': '7'
      },
      showTime: ['10:00 AM', '1:00 PM', '3:30 PM', '6:30 PM', '9:00 PM'],
      reservedSeat: {1: 6, 2: 23, 3: 33, 4: 16, 5: 17, 6: 50, 7: 51},
      price: 40),
  MovieModel(
      title: 'Intrusion',
      image: 'assets/images/intrusion.jpg',
      ratingNumber: '8.6',
      description:
          'Intrusion is a 2021 American psychological thriller film directed by Adam Salky and written by Christopher Sparling, starring Freida Pinto and Logan Marshall-Green. It was released on September 22, 2021, by Netflix.',
      directorName: 'Adam Salky',
      writerName: 'Christopher Sparling',
      weekDays: {'Sun': '1', 'Mon': '2', 'Tue': '3', 'Fri': '6', 'Sat': '7'},
      showTime: [
        '10:05 AM',
        '1:05 PM',
        '4:30 PM',
        '6:30 PM',
      ],
      reservedSeat: {1: 12, 2: 5, 3: 34, 4: 35, 5: 36, 6: 50, 7: 49},
      price: 70),
];
