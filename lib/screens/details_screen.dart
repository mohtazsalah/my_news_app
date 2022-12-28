import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/models/news_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({this.data , Key? key}) : super(key: key);
  NewsData? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.orange.shade900,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data!.title!,
              style: const TextStyle(
                  fontSize: 26.0 ,
                  fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0,),
            Text(
                data!.author!,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20.0,),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(data!.urlToImage!),
            ),
            const SizedBox(height: 30.0,),
            Text(data!.content!),
          ],
        ),
      ),
    );
  }
}
