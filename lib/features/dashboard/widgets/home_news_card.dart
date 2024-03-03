import 'package:charity_management_app/common/functions/date.dart';
import 'package:charity_management_app/features/news/model/news_model.dart';
import 'package:charity_management_app/features/news/presentation/news_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallNewsCard extends StatelessWidget {
  final NewsModel news;

  const SmallNewsCard({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDateTime(news.publishedAt);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => NewsDetailsPage(news),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.network(
                  news.urlToImage!,
                  height: 110.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.sp),
                child: Text(
                  news.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.sp),
                child: Text(
                  "By: ${news.author ?? "Unknown"}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
