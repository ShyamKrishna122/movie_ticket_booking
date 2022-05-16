import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/user_authentication/app/shared/constants.dart';
import '../model/feed.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

import '../model/feedDetail.dart';

class FeedDetail extends StatefulWidget {
  FeedDetail();

  @override
  _MyFeedDetailState createState() => _MyFeedDetailState();
}

class _MyFeedDetailState extends State<FeedDetail> {
  Feed news = Feed('title', 'description', 'urlToImage', 'publishedAt', 1);
  @override
  void initState() {
    news = FeedDetailModel.news;
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
              child: Icon(
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
                      news.urlToImage == null
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width: double.infinity,
                                  child: Image.asset(
                                    news.urlToImage,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Text(
                          news.title,
                          style: TextStyle(
                            color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 25),
                          // style: GoogleFonts.lato(fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
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
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 250,
                                child: Text(
                                  news.title,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey.shade500,
                                size: 25,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                news.publishedAt,
                                  style: TextStyle(
                                      fontSize: 15, fontStyle: FontStyle.italic),
                                maxLines: 2,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      news.description != null
                          ? Container(
                              width: MediaQuery.of(context).size.width - 30,
                              child: DropCapText(
                                news.description,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  // fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                                mode: DropCapMode.inside,
                                indentation: Offset.zero,
                              ),
                            )
                          : Container(),
                    ],
                  ))),
        ));
  }
}
