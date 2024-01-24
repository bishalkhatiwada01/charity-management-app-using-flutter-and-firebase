
import 'package:charity_management_app/features/news/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsModel news;

  const NewsDetailsPage(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          'NEWS DETAILS',
          style: TextStyle(
            letterSpacing: 4,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.urlToImage),
            const SizedBox(height: 16.0),
            Text(
              news.title,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Author: ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,

                      color:
                      Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(text: '${news.author}',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color:
                    Theme.of(context).colorScheme.inversePrimary,

                    fontSize: 14,
                  ),)
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Published At: ',
                    style: TextStyle(
                      color:
                      Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,

                      fontSize: 16,
                    ),
                  ),
                  TextSpan(text: '${news.publishedAt}',style: TextStyle(
                    color:
                    Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,

                  ),)
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Description: ',
                    style: TextStyle(
                      color:
                      Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,

                      fontSize: 18,
                    ),
                  ),
                  TextSpan(text: '${news.description}',style: TextStyle(
                    color:
                    Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,

                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
