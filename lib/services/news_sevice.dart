import 'package:dio/dio.dart';
import 'package:worlednews/models/news_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<NewsModelData>> getNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=dd96bb5c8ca14ae18b2d37d535b1d7cc');
    Map<String, dynamic> jsonData = response.data;
    //List<Map<String , dynamic>> articles = jsonData["articles"] as List<Map <String,dynamic>>;
    List<dynamic> articles = jsonData["articles"];
    List<NewsModelData> newsModelList = [];

    for (var article in articles) {
      NewsModelData newsModelData = NewsModelData(
        newsTitle: article["title"],
        newsDescription: article["description"],
        image: article["urlToImage"],
      );
      newsModelList.add(newsModelData);
    }
    return newsModelList;
    // for(var article in articles ){
    // print(article["author"]);}
  }

  void getGeneralNews() async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=dd96bb5c8ca14ae18b2d37d535b1d7cc');
    print(response);
  }
}
