import 'package:flutter/material.dart';
import 'package:shortnewsapp/NewsData.dart';

import 'NewsModel.dart';
import 'NewsTile.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  late List<NewsModel> newsList ;
  bool loadingData = true;
  int nextIndex = 0;
  List<Widget> newsTiles = [];
  // late NewsModel curNews;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  void getNews() async {
    NewsData newsData = new NewsData();
    await newsData.getNews();
    newsList = newsData.newsList;
    nextIndex++;
    getNewsTiles();
  }
  void getNewsTiles(){
    for(NewsModel news in newsList){
      newsTiles.add(NewsTile(curNews: news));
    }
    setState(() {
      loadingData = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    PageController controller = PageController(initialPage: 0);

    return Scaffold(
      body: loadingData ?
      Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
      ): Container(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: newsTiles,
          controller: controller,
        ),
      )
    );
  }

}
