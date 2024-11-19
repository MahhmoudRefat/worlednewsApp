import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:worlednews/models/category_model.dart';
import 'package:worlednews/models/news_model.dart';
import 'package:worlednews/services/news_sevice.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.newsModelData});

  final NewsModelData newsModelData;

  @override
  Widget build(BuildContext context) {
    NewsService(Dio()).getNews();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity, // Set the width
            height: 220.0, // Set the height (optional)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), // Set the corner radius
              image: DecorationImage(
                image: AssetImage(newsModelData.image??"https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png"),
                fit: BoxFit.cover, // Adjusts the image to fill the space
              ),
            ),
          ),
        ),
        Text(
          newsModelData.newsTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          newsModelData.newsDescription ?? "no Description available ",
          maxLines: 2,
        ),
      ],
    );
  }
}
