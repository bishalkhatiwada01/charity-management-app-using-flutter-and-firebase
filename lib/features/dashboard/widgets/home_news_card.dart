// import 'package:charity_management_app/features/news/model/news_model.dart';
// import 'package:charity_management_app/features/news/view/news_detail_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SmallNewsCard extends ConsumerStatefulWidget {
//   final NewsModel news;
//   const SmallNewsCard({
//     required this.news,
//     super.key,
//   });

//   @override
//   ConsumerState<SmallNewsCard> createState() => _SmallNewsCardState();
// }

// class _SmallNewsCardState extends ConsumerState<SmallNewsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (_) => NewsDetailsPage(
//               widget.news,
//             ),
//           ),
//         );
//       },
//       child: Card(
//         elevation: 4.0,
//         margin: const EdgeInsets.all(10.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: SizedBox(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(12.0)),
//                 child: Image.network(
//                   widget.news.urlToImage,
//                   height: 80.0,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   widget.news.title,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
