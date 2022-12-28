
class ArticlesModel{

  final String? title ;
  final String? description ;
  final String? articleUrl ;
  final String? imageUrl ;

  ArticlesModel({this.title, this.description, this.articleUrl, this.imageUrl});

  factory ArticlesModel.fromJason (Map<String , dynamic> jsonData){
    return ArticlesModel(
        title: jsonData['title'],
        description: jsonData['description'],
        articleUrl: jsonData['url'],
        imageUrl: jsonData['urlToImage']
    );
  }
}