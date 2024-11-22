import 'package:flutter/material.dart';
import 'package:worlednews/widgets/news_listview.dart';
import 'package:worlednews/widgets/news_listview_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(
            category: category,
          ),
        ],),);
  }
}
