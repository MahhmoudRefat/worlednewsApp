import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:worlednews/models/category_model.dart';
import 'package:worlednews/models/news_model.dart';
import 'package:worlednews/services/news_sevice.dart';

import '../views/article_external_web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.newsModelData});

// cached network image

  final NewsModelData newsModelData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity, // Set the width
          height: 200.0, // Set the height (optional)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), // Set the corner radius
            image: DecorationImage(
              image: NetworkImage(newsModelData.image ??
                  "https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png"),
              fit: BoxFit.cover, // Adjusts the image to fill the space
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ArticleExternalWebView(url: newsModelData.url ?? "");
                },
              ),
            );
          },
          child: Text(
            newsModelData.newsTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Text(
          newsModelData.newsDescription ?? "no Description available ",
          maxLines: 2,
        ),
      ],
    );
  }
}
