
import 'package:charity_management_app/features/news/models/news_model.dart';
import 'package:charity_management_app/features/news/services/news_service.dart';
import 'package:charity_management_app/features/news/widgets/post_card.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsService _newsService = NewsService();
  late Future<List<NewsModel>> _news;

  @override
  void initState() {
    super.initState();
    _news = _newsService.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,

        title: const Text(
          'NEWS',
          style: TextStyle(letterSpacing: 4),
        ),
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No news available.",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final news = snapshot.data![index];
                return NewsCard(news: news);
              },
            );
          }
        },
      ),
    );
  }
}
