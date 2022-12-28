
import 'package:flutter/material.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/models/news_model.dart';
import 'package:my_news_app/service/news_services.dart';

class ArticleViewModel extends ChangeNotifier{
  List<ArticlesModel> _articleList = [];
  List<ArticlesModel> _categoryList = [];

  List<NewsData> _newsList = [];

  fetchArticles() async {
    _articleList = await NewsApi().fetchArticles();
    notifyListeners();
  }

  fetchArticlesByCategory(String cat) async {
    _categoryList = await NewsApi().fetchArticlesByCategory(cat);
    notifyListeners();
  }

  fetchNewsData() {
    _newsList = NewsData.breakingNewsData;
    notifyListeners();
  }

  List<ArticlesModel> get articleList => _articleList ;
  List<NewsData> get newsList => _newsList ;
  List<ArticlesModel> get categoryList => _categoryList ;

}