// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:charity_management_app/common/functions/date.dart';
import 'package:charity_management_app/features/posts/pages/post_detail_page.dart';

class PostCard extends StatelessWidget {
  final String headline;
  final String content;
  final String address;
  final String contact;
  final String imageUrl;
  final String date;
  final String postId;

  const PostCard({super.key, 
    required this.headline,
    required this.imageUrl,
    required this.content,
    required this.address,
    required this.contact,
    required this.date,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDateTime(date);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PostDetailsPage(
              headline: headline,
              content: content,
              address: address,
              contact: contact,
              imageUrl: imageUrl,
              date: formattedDate,
              postId: postId,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                imageUrl,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate,
                        style: const TextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
