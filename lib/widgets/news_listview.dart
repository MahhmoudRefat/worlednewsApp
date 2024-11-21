import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../main.dart';
import '../models/news_model.dart';
import 'category_container.dart';
import 'news_container.dart';
import 'news_listview_builder.dart';

class NewsListview extends StatelessWidget {
   NewsListview({super.key , required this.newsModelData});

  List<NewsModelData> newsModelData = [];

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        /********* Category  List *****************/
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryModelData.length,
                itemBuilder: (context, index) {
                  return CategoryContainer(
                      categoryModelData: categoryModelData[index]);
                }),
          ),
        ),
        /********* News List *****************/
        SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: newsModelData.length, (context, index) {
              return NewsContainer(newsModelData: newsModelData[index]);
            }))
      ],
    );
  }
}
