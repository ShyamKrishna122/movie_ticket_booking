import 'package:flutter/material.dart';

import '../model/feed.dart';

class BookmarkWidget extends StatelessWidget {
  final Feed article;
  final Color color;
  final double size;

  const BookmarkWidget({
    Key? key,
    required this.article,
    required this.color,
    this.size = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){},
            child: Icon(Icons.bookmark_border_outlined,
              size: size,
              color: color,
            ),
        );
  }

}
