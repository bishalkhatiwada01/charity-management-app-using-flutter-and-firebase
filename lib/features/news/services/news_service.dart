import 'dart:convert';
import 'package:charity_management_app/features/news/models/news_model.dart';
import 'package:flutter/services.dart';

class NewsService {
  Future<List<NewsModel>> getNews() async {
    try {
      // Load data from the JSON file
      String jsonData = await rootBundle.loadString('assets/news_data.json');

      Map<String, dynamic> jsonMap = json.decode(jsonData);
      List<dynamic> data = jsonMap["news"];

      // Convert data to a list of NewsModel
      List<NewsModel> newsList =
          data.map((json) => NewsModel.fromJson(json)).toList();
      return newsList;
    } catch (error) {
      throw Exception("Failed to load news: $error");
    }
  }
}
