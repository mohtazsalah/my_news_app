import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_news_app/components/breaking_news_card.dart';
import 'package:my_news_app/components/news_list_tile.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/models/articles_parent_model.dart';
import 'package:my_news_app/models/news_model.dart';
import 'package:my_news_app/view_model/article_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ArticleViewModel>(context).fetchNewsData();
    // var items = Provider.of<ArticleViewModel>(context).articleList;
    var items = Provider.of<ArticleViewModel>(context).newsList;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'News App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.notifications_outlined ,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Breaking News',
                style: TextStyle(
                  fontSize: 24.0 ,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              CarouselSlider.builder(
                  itemCount: items.length,
                  itemBuilder: (context , index , id) =>
                      BreakingNewsCard(model: items[index]),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9 ,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                  ),
              ),
              SizedBox(height: 40.0),
              Text(
                'Rcent News',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0,),
              Column(
                children: items
                    .map((e) => NewsListTile(data: e))
                    .toList(),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          selectedItemColor: Colors.orange.shade900,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.home) ,
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark) ,
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed_rounded) ,
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person) ,
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
