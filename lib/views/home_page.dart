import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:worlednews/models/category_model.dart';
import 'package:worlednews/models/news_model.dart';
import 'package:worlednews/services/news_sevice.dart';
import 'package:worlednews/widgets/category_container.dart';
import 'package:worlednews/widgets/news_container.dart';

import '../widgets/news_listview_builder.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<NewsModelData> newsModelData = [];

// Future<void> getGeneralNews() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" World "),
              Text(
                "News ",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          centerTitle: true,
        ),
        /******************* The body *******/
        body: NewsListViewBuilder());

  }
}



// Column(
//   children: [
//     SizedBox(
//       height: 200,
//       child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//           itemCount: categoryModelData.length,
//           itemBuilder: (context, index) {
//             return CategoryContainer(categoryModelData: categoryModelData[index]);
//           }),
//     ),
//     Expanded(
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//           itemCount: newsModelData.length,
//           itemBuilder: (context, index) {
//             return NewsContainer(newsModelData: newsModelData[index]);
//           }),
//     ),
//   ],
// ),