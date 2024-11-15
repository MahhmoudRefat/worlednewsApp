import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:worlednews/services/news_sevice.dart';
import 'package:worlednews/views/home_page.dart';

final dio = Dio();

void main() {
  //NewsService(dio).getNews();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

