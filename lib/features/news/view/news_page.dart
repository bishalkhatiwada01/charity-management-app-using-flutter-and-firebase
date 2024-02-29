import 'package:charity_management_app/common/widgets/custom_app_bar.dart';
import 'package:charity_management_app/features/news/controller/fetch_news.dart';
import 'package:charity_management_app/features/news/model/news_model.dart';
import 'package:charity_management_app/features/news/view/widgets/news_card.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<NewsModel>>? newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = FetchNews.fetchNewNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'NEWS',
      ),
      drawer: Drawer(),
      body: FutureBuilder<List<NewsModel>>(
        future: newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsCard(news: snapshot.data![index]);
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}
