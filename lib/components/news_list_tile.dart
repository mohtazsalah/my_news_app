import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/models/news_model.dart';
import 'package:my_news_app/screens/details_screen.dart';

class NewsListTile extends StatelessWidget {
  NewsListTile({this.data ,Key? key}) : super(key: key);
  NewsData? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => DetailsScreen(data: data,),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(12.0),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(data!.urlToImage!),
                      fit: BoxFit.fitHeight,
                    )
                  ),
              ),
            ),
            SizedBox(width: 10.0,),
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  Text(
                    data!.title!,
                    style: TextStyle(
                      color: Colors.white ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    data!.content!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
