import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/booking_tickets/models/ticket_model.dart';
import 'package:movie_booking_app/user_authentication/meta/utils/utils.dart';
import 'package:movie_booking_app/user_authentication/meta/views/home_view.dart';

class ReviewScreen extends StatelessWidget {
  static const routeName = "/reviewscreen";

  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: size.height * 3 / 4,
                  width: size.width * 4 / 5,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blueGrey,
                          width: double.infinity,
                          height: size.height / 3,
                          child: Image.asset(
                            TicketModel.photoUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TicketModel.movieName,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  TicketModel.theaterName,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  DateFormat("MMMMd").format(TicketModel.date) +
                                      ", " +
                                      TicketModel.time,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  TicketModel.ticketType == "0"
                                      ? TicketModel.tickets.toString() +
                                          " King" +
                                          " tickets"
                                      : TicketModel.ticketType == "1"
                                          ? TicketModel.tickets.toString() +
                                              " Queen" +
                                              " tickets"
                                          : TicketModel.tickets.toString() +
                                              " Jack" +
                                              " tickets",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  TicketModel.ticketType == "0"
                                      ? TicketModel.tickets.toString() +
                                          " x" +
                                          " 120 Rs    =    " +
                                          (TicketModel.tickets * 120)
                                              .toString() +
                                          " Rs"
                                      : TicketModel.ticketType == "1"
                                          ? TicketModel.tickets.toString() +
                                              " x" +
                                              " 100 Rs    =    " +
                                              (TicketModel.tickets * 100)
                                                  .toString() +
                                              " Rs"
                                          : TicketModel.tickets.toString() +
                                              " x" +
                                              " 80 Rs    =    " +
                                              (TicketModel.tickets * 80)
                                                  .toString() +
                                              " Rs",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Text(
                  "Review",
                  style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                top: 20,
                left: 20,
              ),
              Positioned(
                child: TextButton(
                  onPressed: () {
                    Utils.snackBar(message: "Ticket Booked", context: context);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor),
                    child: const Text(
                      "Book now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                bottom: 20,
                right: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
