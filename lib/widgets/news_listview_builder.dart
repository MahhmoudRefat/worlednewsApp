import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:worlednews/widgets/news_listview.dart';

import '../models/category_model.dart';
import '../models/news_model.dart';
import '../services/news_sevice.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  //bool isLoading = true;
  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }

  // Future<void> getGeneralNews() async {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModelData>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListview(newsModelData: snapshot.data!);
          }
          else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(child: Text("ops there was an error , try later ")),
            );
          }
          else {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
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
  CategoryModelData(
    image: "assets/technology.jpeg",
    categoryName: "technology",
  ),
  CategoryModelData(
    image: "assets/bussines.png",
    categoryName: "Business",
  ),
];

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
