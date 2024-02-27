// import 'dart:convert';
// import 'package:charity_management_app/features/news/model/news_model.dart';
// import 'package:http/http.dart' as http;

// class FetchNews {
//   static Future<List<NewsModel>> fetchNewNews() async {
//     print('Getting news');

//     try {
//       final response = await http.get(Uri.parse(
//           "https://newsdata.io/api/1/news?apikey=pub_28088ad00c1df3a75c1d433e90c794f4970dd&q=natural%20disaster&language=en"));

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         List articles = data["articles"];

//         final newsList =
//             articles.map((json) => NewsModel.fromJson(json)).toList();
//         return newsList;
//       } else {
//         throw Exception('Failed to load news');
//       }
//     } catch (e) {
//       print('Error fetching news: $e');
//       throw Exception('Failed to load news');
//     }
//   }
// }
