import 'package:charity_management_app/common/functions/date.dart';
import 'package:charity_management_app/features/news/model/news_model.dart';
import 'package:charity_management_app/features/news/view/news_detail_page.dart';
import 'package:charity_management_app/features/newsAPi/data/news_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsCard extends ConsumerWidget {
  const NewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final newsData = ref.watch(newsProvider);
    // String formattedDate = formatDateTime(newsData.data[index].publishedAt);

    return InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (_) => NewsDetailsPage(
          //       news,
          //     ),
          //   ),
          // );
        },
        child: newsData.when(
          data: (data) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final news = data[index];
                String formattedDate = formatDateTime(news.publishedAt);
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12.0)),
                        child: Image.network(
                          news.imageUrl!,
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              'Author: ${news.author}', // Include author here
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Published At: $news.publishedAt",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: data.length,
            );
          },
          error: (error, stack) => Text('Error: $error'),
          loading: () => CircularProgressIndicator(),
        ));
  }
}
