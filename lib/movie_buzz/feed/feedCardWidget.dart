import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:share_plus/share_plus.dart';
import '../model/feed.dart';
import '../model/feedDetail.dart';
import 'bookmarkWidget.dart';

class FeedCardWidget extends StatefulWidget {
  FeedCardWidget({Key? key, required this.article}) : super(key: key);
  final Feed article;
  bool isLike = false;

  @override
  _FeedCardWidgetState createState() => _FeedCardWidgetState();
}

class _FeedCardWidgetState extends State<FeedCardWidget> {
  Future<void> share(Feed article) async {
    await FlutterShare.share(
        title: article.title,
        text: article.description,
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
        elevation: 3.0,
        child:  GestureDetector(
            onTap: () {
              FeedDetailModel.news = widget.article;
              Navigator.pushNamed(context, 'feedDetail');
            },
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ), // margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.article.urlToImage,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.article.title,
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10),
                            BookmarkWidget(
                              article: widget.article,
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(widget.isLike){
                                        widget.article.rating -= 1;
                                      }
                                      else{
                                        widget.article.rating += 1;
                                      }
                                        widget.isLike = !widget.isLike;
                                    });
                                  },
                                  child: Icon(
                                    widget.isLike
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 25,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.article.rating.toString(),
                                  style: TextStyle(fontSize: 19),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () async{
                                await share(widget.article);
                              },
                              child: Icon(
                                Icons.share,
                                size: 28,
                                color: Colors.blueAccent,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
