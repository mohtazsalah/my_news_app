
class ArticlesParent{

  final List<dynamic>? articles ;

  ArticlesParent({this.articles});

  factory ArticlesParent.fromJson(Map<String , dynamic> jsonData){

    return ArticlesParent(
        articles: jsonData['articles']
    );
  }
}