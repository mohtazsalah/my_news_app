import 'package:flutter/material.dart';
import 'package:my_news_app/screens/home_screen.dart';
import 'package:my_news_app/view_model/article_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleViewModel>(
      create: (context) => ArticleViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
