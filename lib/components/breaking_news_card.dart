import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/models/news_model.dart';
import 'package:my_news_app/screens/details_screen.dart';
import 'package:my_news_app/view_model/article_view_model.dart';

class BreakingNewsCard extends StatelessWidget {
  BreakingNewsCard({this.model ,Key? key}) : super(key: key);
  NewsData? model ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(data: model),),);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(model!.urlToImage!),
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model!.title!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0,),
              Text(
                model!.author!,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
