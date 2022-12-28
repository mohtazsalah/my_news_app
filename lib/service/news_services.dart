import 'dart:convert';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/models/articles_parent_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {

  final String apiKey = 'b08c257bac2c4ef6a269469d85eac98d';

  Future<List<ArticlesModel>> fetchArticles() async{
    List<ArticlesModel> articles2 = <ArticlesModel>[];
    try {
      var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey');
      http.Response response = await http
          .get(url);

      if (response.statusCode == 200){
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesParent articlesParent = ArticlesParent.fromJson(jsonData);
        List<ArticlesModel> articlesList =
        articlesParent.articles!.map((e) => ArticlesModel.fromJason(e)).toList();
        return articlesList ;
      }else{
        print('status code = ${response.statusCode}');
      }
    }catch (ex) {
      print(ex);
    }
    return articles2 ;
  }

  Future<List<ArticlesModel>> fetchArticlesByCategory(String category) async{
    List<ArticlesModel> articles2 = <ArticlesModel>[];
    try {
      var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey');
      http.Response response = await http
          .get(url);

      if (response.statusCode == 200){
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesParent articlesParent = ArticlesParent.fromJson(jsonData);

        List<ArticlesModel> articlesList = articlesParent.articles!.map((e) => ArticlesModel.fromJason(e)).toList();

        return articlesList ;
      }else{
        print('status code = ${response.statusCode}');
      }
    }catch (ex) {
      print(ex);
    }
    return articles2 ;
  }
}