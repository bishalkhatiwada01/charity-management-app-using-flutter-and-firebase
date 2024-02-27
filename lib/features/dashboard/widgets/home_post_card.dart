import 'package:charity_management_app/features/posts/data/post_data_model.dart';
import 'package:charity_management_app/features/posts/pages/post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallPostCard extends ConsumerStatefulWidget {
  final PostData postData;

  const SmallPostCard({
    required this.postData,
    super.key,
  });

  @override
  ConsumerState<SmallPostCard> createState() => _SmallPostCardState();
}

class _SmallPostCardState extends ConsumerState<SmallPostCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PostDetailsPage(
              postModel: widget.postData,
            ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.network(
                  widget.postData.postImageUrl!,
                  height: 75.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  widget.postData.postHeadline,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                   widget.postData.postAddress,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.0,
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
