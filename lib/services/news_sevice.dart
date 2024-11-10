
import 'package:dio/dio.dart';

class NewsService{

  final Dio dio ;
  NewsService(this.dio);

  void getNews() async {
    final response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=dd96bb5c8ca14ae18b2d37d535b1d7cc');
    print(response);
  }
  void getGeneralNews() async {
    final response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=dd96bb5c8ca14ae18b2d37d535b1d7cc');
    print(response);
  }



}