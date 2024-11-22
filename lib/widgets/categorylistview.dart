import 'package:flutter/material.dart';

import 'category_container.dart';
import 'news_listview_builder.dart';
class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryModelData.length,
          itemBuilder: (context, index) {
            return CategoryContainer(
                categoryModelData: categoryModelData[index]);
          }),
    );
  }
}
