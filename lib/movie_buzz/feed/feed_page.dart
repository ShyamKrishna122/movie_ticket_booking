import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import 'feed_list_widget.dart';

class FeedPage extends StatefulWidget {
  final String title = 'Movie Feeds';

  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('Trending Movie Feeds',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: FeedListViewWidget(
                      // articles: getFeeds,
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
