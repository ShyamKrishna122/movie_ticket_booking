import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import '../model/feed.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

import '../model/feed_detail.dart';

class FeedDetail extends StatefulWidget {
  const FeedDetail({Key? key}) : super(key: key);

  @override
  _MyFeedDetailState createState() => _MyFeedDetailState();
}

class _MyFeedDetailState extends State<FeedDetail> {
  Feed news = Feed('title', 'description', 'urlToImage', 'publishedAt', 1);
  @override
  void initState() {
    news = FeedDetailModel.news;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text(news.title, style: GoogleFonts.lato(),),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.close,
                color: kprimaryColor,
              )),
        ),
        body: SingleChildScrollView(
          child: Card(
              elevation: 2,
              child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: double.infinity,
                            child: Image.asset(
                              news.urlToImage,
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Text(
                          news.title,
                          style: const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 25),
                          // style: GoogleFonts.lato(fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.radio,
                                size: 25,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 250,
                                child: Text(
                                  news.title,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey.shade500,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                news.publishedAt,
                                style: const TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic),
                                maxLines: 2,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      SizedBox(
                              width: MediaQuery.of(context).size.width - 30,
                              child: DropCapText(
                                news.description,
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  // fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                                mode: DropCapMode.inside,
                                indentation: Offset.zero,
                              ),
                            )
                          
                    ],
                  ))),
        ));
  }
}
