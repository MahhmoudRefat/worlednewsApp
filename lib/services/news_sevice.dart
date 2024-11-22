import 'package:dio/dio.dart';
import 'package:worlednews/models/news_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<NewsModelData>> getTopHeadlines({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=dd96bb5c8ca14ae18b2d37d535b1d7cc&category=$category');
      Map<String, dynamic> jsonData = response.data;
      //List<Map<String , dynamic>> articles = jsonData["articles"] as List<Map <String,dynamic>>;
      List<dynamic> articles = jsonData["articles"];
      List<NewsModelData> newsModelList = [];
      /*********** Data parsing ****************/
      for (var article in articles) {
        NewsModelData newsModelData = NewsModelData(
          newsTitle: article["title"],
          newsDescription: article["description"],
          image: article["urlToImage"],
          url: article["url"]
        );
        newsModelList.add(newsModelData);
      }
      return newsModelList;
    }  catch (e) {
      return[];
    }
    // for(var article in articles ){
    // print(article["author"]);}
  }

}
