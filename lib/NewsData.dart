
import 'dart:convert';

import 'package:shortnewsapp/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsData{

  List<NewsModel> newsList = [];

  Future<void> getNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=3d1ef49c149c457ab577fd0ddba445c8";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element['description'] != null){
          NewsModel articleModel = new NewsModel(
            title: element['title'],
            description: element['description'],
            imageUrl: element['urlToImage'],
          );
          newsList.add(articleModel);
        }
      });
    }
  }
}
