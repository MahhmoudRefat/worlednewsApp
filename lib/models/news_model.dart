class NewsModelData{
  NewsModelData( {required this.newsTitle, required this.newsDescription, required this.image , required this.url});
   final String? image ;
   final String newsTitle;
   final String? newsDescription;
   final String? url;

  factory NewsModelData.fromJson(json){
    return NewsModelData(newsTitle: json["title"],
        newsDescription: json["description"],
        image: json["urlToImage"],
        url: json["url"]);
  }


}