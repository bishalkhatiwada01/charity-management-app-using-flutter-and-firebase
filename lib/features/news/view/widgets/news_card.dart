// import 'package:charity_management_app/common/functions/date.dart';
// import 'package:charity_management_app/features/news/model/news_model.dart';
// import 'package:charity_management_app/features/news/view/news_detail_page.dart';

// import 'package:flutter/material.dart';

// class NewsCard extends StatelessWidget {
//   final NewsModel news;

//   const NewsCard({
//     super.key,
//     required this.news,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String formattedDate = formatDateTime(news.publishedAt);

//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (_) => NewsDetailsPage(
//               news,
//             ),
//           ),
//         );
//       },
//       child: Card(
//         elevation: 4.0,
//         margin: const EdgeInsets.all(16.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12.0)),
//               child: Image.network(
//                 news.urlToImage,
//                 height: 200.0,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 news.title,
//                 style: const TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 8),
//                   Text(
//                     'Author: ${news.author}', // Include author here
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     "Published At: $formattedDate",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
