import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:worlednews/models/category_model.dart';
import 'package:worlednews/models/news_model.dart';
import 'package:worlednews/widgets/category_container.dart';
import 'package:worlednews/widgets/news_container.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final List<NewsModelData> newsModelData = [
    NewsModelData(
        newsTitle: "ارتفاع أسعار الوقود في مصر يثير موجة من الجدل",
        newsDescription:
            "شهدت مصر اليوم ارتفاعاً ملحوظاً في أسعار الوقود، مما أثار ردود فعل واسعة بين المواطنين وأصحاب المركبات. يترقب المواطنون تأثير هذه الزيادة على أسعار السلع والخدمات، وسط دعوات من الخبراء لترشيد استهلاك الطاقة",
        image: "assets/news1.png"),
    NewsModelData(
        newsTitle: "ارتفاع أسعار الوقود في مصر يثير موجة من الجدل",
        newsDescription:
            "شهدت مصر اليوم ارتفاعاً ملحوظاً في أسعار الوقود، مما أثار ردود فعل واسعة بين المواطنين وأصحاب المركبات. يترقب المواطنون تأثير هذه الزيادة على أسعار السلع والخدمات، وسط دعوات من الخبراء لترشيد استهلاك الطاقة",
        image: "assets/news1.png")
  ];

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
        body: CustomScrollView(
          slivers: [
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
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: newsModelData.length, (context, index) {
              return NewsContainer(newsModelData: newsModelData[index]);
            }))
          ],
        )
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

        );
  }
}
