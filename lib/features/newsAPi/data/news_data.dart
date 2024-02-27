import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class Results {
  String author;
  String title;
  String description;
  String url;
  String content;
  String publishedAt;
  String? imageUrl;

  Results({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.content,
    required this.publishedAt,
    this.imageUrl,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      title: json['title'],
      description: json['description'],
      content: json['content'],
      publishedAt: json['pubDate'],
      url: json['link'],
      imageUrl: json['image_url'],
      author: json['source_id'],
    );
  }
}

Future<List<Results>> fetchNews() async {
  final response = await http.get(Uri.parse(
      'https://newsdata.io/api/1/news?apikey=pub_28088ad00c1df3a75c1d433e90c794f4970dd&q=volunteer,%20charity,%20donation'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    final List<dynamic> resultsJson = jsonData['results'];
    return resultsJson.map((json) => Results.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load news');
  }
}

final newsProvider = FutureProvider<List<Results>>((ref) async {
  return fetchNews();
});
