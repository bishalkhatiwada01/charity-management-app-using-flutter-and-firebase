import 'dart:convert';
import 'package:charity_management_app/features/news/model/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class FetchNews {
  static Future<List<NewsModel>> fetchNewNews() async {
    print('Getting news');

    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=donation&apiKey=8bb7077d007f40a69f040d2d91364547"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        List articles = data["articles"];

        final newsList =
            articles.map((json) => NewsModel.fromJson(json)).toList();
        return newsList;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print('Error fetching news: $e');
      throw Exception('Failed to load news');
    }
  }
}

final newsProvider = FutureProvider<List<NewsModel>>(
      (ref) => FetchNews.fetchNewNews(),
);
