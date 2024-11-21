import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worlednews/widgets/news_listview.dart';

import '../models/category_model.dart';
import '../models/news_model.dart';
import '../services/news_sevice.dart';
import 'category_container.dart';
import 'news_container.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

final List<CategoryModelData> categoryModelData = [
  CategoryModelData(
    image: "assets/bussines.png",
    categoryName: "Business",
  ),
  CategoryModelData(
    image: "assets/technology.jpeg",
    categoryName: "technology",
  ),
];

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  bool isLoading = true; // حالة التحميل

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getGeneralNews();
  }

  // Future<void> getGeneralNews() async {
  //   newsModelData =  await NewsService(Dio()).getNews();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder( future : NewsService(Dio()).getNews(),
        builder: (context,snapshot){
      return NewsListview(newsModelData: snapshot.data ?? [] );

    });

    // return isLoading
    //     ? const Center(
    //   child: CircularProgressIndicator(), // مؤشر تحميل
    // )
    //     : newsModelData.isNotEmpty? CustomScrollView(
    //   slivers: [
    //     /********* Category  List *****************/
    //     SliverToBoxAdapter(
    //       child: SizedBox(
    //         height: 200,
    //         child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: categoryModelData.length,
    //             itemBuilder: (context, index) {
    //               return CategoryContainer(
    //                   categoryModelData: categoryModelData[index]);
    //             }),
    //       ),
    //     ),
    //     /********* News List *****************/
    //     SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //             childCount: newsModelData.length, (context, index) {
    //           return NewsContainer(newsModelData: newsModelData[index]);
    //         }))
    //   ],
    // ): SliverToBoxAdapter(
    //   child: Center(child: Text("ops there was an error , try later ")),
    // );
  }
}


