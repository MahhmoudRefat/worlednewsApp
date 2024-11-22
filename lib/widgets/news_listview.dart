import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../main.dart';
import '../models/news_model.dart';
import 'category_container.dart';
import 'categorylistview.dart';
import 'news_tile.dart';
import 'news_listview_builder.dart';

class NewsListview extends StatelessWidget {
  const NewsListview({super.key, required this.newsModelData});

  final List<NewsModelData> newsModelData;
 // List<NewsModelData> newsModelData = [];

  @override
  Widget build(BuildContext context) {
    return
        /********* News List *****************/
        SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: newsModelData.length, (context, index) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: NewsTile(newsModelData: newsModelData[index]),
      );
    }));
  }
}
