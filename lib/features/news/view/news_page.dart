// import 'package:charity_management_app/features/news/controller/fetch_news.dart';
// import 'package:charity_management_app/features/news/model/news_model.dart';
// import 'package:charity_management_app/features/news/view/widgets/news_card.dart';
// import 'package:flutter/material.dart';

// class NewsPage extends StatefulWidget {
//   const NewsPage({super.key});

//   @override
//   State<NewsPage> createState() => _NewsPageState();
// }

// class _NewsPageState extends State<NewsPage> {
//   bool isLoading = true;

//   List<NewsModel> news = [];

//   void getNews() async {
//     final response = await FetchNews.fetchNewNews();
//     setState(() async {
//       news = response;
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: news.isEmpty
//           ? Center(
//               child: Text('No news found!'),
//             )
//           : ListView.builder(
//               itemBuilder: (context, index) {
//                 return NewsCard(news: news[index]);
//               },
//               itemCount: news.length,
//             ),
//     );
//   }
// }
