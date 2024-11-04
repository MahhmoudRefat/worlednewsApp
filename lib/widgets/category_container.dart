import 'package:flutter/material.dart';
import 'package:worlednews/models/category_model.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.categoryModelData});

  final CategoryModelData categoryModelData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 250, // Set the width
            height: 150,
            // Set the height (optional)
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              // Set the corner radius
              image: DecorationImage(
                image: AssetImage(categoryModelData.image),
                fit: BoxFit.cover, // Adjusts the image to fill the space
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5), // Black color with low opacity
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Add padding around the text
          child: Text(
            categoryModelData.categoryName,
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center, // Center align text if it spans multiple lines
          ),
        ),
      ],
    );
  }
}
