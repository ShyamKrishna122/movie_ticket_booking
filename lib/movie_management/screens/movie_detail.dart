import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_booking_app/booking_tickets/theater_screen.dart';
import 'package:movie_booking_app/movie_management/models/movie_model.dart';

import '../../user_authentication/app/shared/constants.dart';
import '../../user_authentication/meta/widget/primary_button.dart';
import '../themes/colors.dart';
import '../widgets/ratings_and_imdb.dart';

class MovieDetail extends StatefulWidget {
  final int index;
  const MovieDetail(this.index, {Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 380,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Hero(
                      tag: widget.index,
                      child: Image.asset(
                        movieDataList[widget.index].image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 25,
                    child: ratingsAndImdb(
                      15,
                      movieDataList[widget.index].ratingNumber!,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              dense: true,
              leading: Icon(
                FontAwesomeIcons.diamondTurnRight,
                color: white.withOpacity(0.5),
                size: 17,
              ),
              title: Text(
                'Director',
                style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                movieDataList[widget.index].directorName!,
                style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 13,
                ),
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                FontAwesomeIcons.pen,
                size: 17,
                color: white.withOpacity(0.5),
              ),
              title: Text(
                'Writer(s)',
                style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                movieDataList[widget.index].writerName!,
                style: TextStyle(
                  color: white.withOpacity(0.5),
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 320,
              child: Text(
                movieDataList[widget.index].description!,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    height: 1.5,
                    color: white.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: const EdgeInsets.only(
            //       left: 20, right: 20, top: 15, bottom: 10),
            //   child: Text(
            //     'Select Date',
            //     style: TextStyle(
            //         color: white.withOpacity(0.7),
            //         fontSize: 17,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: PrimaryButton(
                text: "Book Ticket",
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TheaterScreen(
                      movieName: movieDataList[widget.index].title!,
                      photoUrl: movieDataList[widget.index].image!,
                    ),
                  ));
                },
                color: kprimaryColor,
              ),
            ),
            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(
            //     itemCount: movieDataList[widget.index].weekDays!.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (_, index) {
            //       return GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               _position = _position == index ? null : index;
            //             });
            //           },
            //           child: weekdayCard(index, widget.index, _wdColor));
            //     },
            //     shrinkWrap: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  int? _position;

  Widget weekdayCard(int index, int widgetIndex, Color color) => Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color:
              _position != null && index == _position ? red! : backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white.withOpacity(0.5), width: 0.5),
        ),
        //height: 60,
        width: 50,
        child: Column(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: _position != null && index == _position
                    ? backgroundColor
                    : gold.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Text(
              movieDataList[widgetIndex].weekDays!.keys.elementAt(index),
              style: TextStyle(
                color: _position != null && index == _position
                    ? white
                    : white.withOpacity(0.5),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              movieDataList[widgetIndex].weekDays!.values.elementAt(index),
              style: TextStyle(
                  color: _position != null && index == _position
                      ? white
                      : white.withOpacity(0.5),
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
