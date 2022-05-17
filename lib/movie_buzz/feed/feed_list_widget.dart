import 'package:flutter/material.dart';
import '../model/feed.dart';
import 'feed_card_widget.dart';

class FeedListViewWidget extends StatefulWidget {
  const FeedListViewWidget({Key? key}) : super(key: key);

  @override
  State<FeedListViewWidget> createState() => _FeedListViewWidgetState();
}

class _FeedListViewWidgetState extends State<FeedListViewWidget> {

  List<Feed> articles = [];
  @override
  void initState() {
    articles = Feed.feedList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (_, index) {
          return FeedCardWidget(
            article: articles[index],
          );
        },
    );
  }
}
