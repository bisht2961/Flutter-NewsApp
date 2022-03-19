import 'package:flutter/material.dart';
import 'package:shortnewsapp/NewsModel.dart';

class NewsTile extends StatelessWidget {
  final NewsModel curNews;
  const NewsTile({Key? key,required this.curNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: size.width,
        child:Column(
          children: [
            Container(
              height: size.height*0.5,
              width: size.width,
              padding: EdgeInsets.all(10.0),
              child: Image.network(curNews.imageUrl,fit: BoxFit.cover,),
            ),
            Container(
              height: size.height*0.5,
              width: size.width,
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    curNews.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Text(
                      curNews.description,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
