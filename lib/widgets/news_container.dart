import 'package:flutter/material.dart';
import 'package:worlednews/models/category_model.dart';
import 'package:worlednews/models/news_model.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.newsModelData});

  final NewsModelData newsModelData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity, // Set the width
            height: 250.0, // Set the height (optional)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), // Set the corner radius
              image: DecorationImage(
                image: AssetImage(newsModelData.image),
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
          newsModelData.newsDescription,
          maxLines: 2,
        ),
      ],
    );
  }
}
