import 'package:charity_management_app/common/widgets/my_drawer.dart';
import 'package:charity_management_app/features/posts/data/post_data.dart';
import 'package:charity_management_app/features/posts/widgets/post_card..dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  // text controller
  final TextEditingController newPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          title: const Text(
            'POSTS',
            style: TextStyle(letterSpacing: 6),
          ),
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // posts
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    // Access the data
                    final posts = snapshot.data?.docs;

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: posts?.length,
                      itemBuilder: (context, index) {
                        // Access individual post data
                        final post = posts?[index];
                        final String postId = post!.id;
                        String headline = post?['postHeadline'];
                        String content = post?['postContent'];
                        String address = post?['postAddress'];
                        String contact = post?['postContact'];
                        String imageUrl = post?['postImageUrl'];
                        Timestamp timestamp = post?['postCreatedAt'];
                        String date = timestamp
                            .toDate()
                            .toString(); // Convert timestamp to date

                        // You can use this data to display it in your UI
                        return PostCard(
                          headline: headline,
                          date: date,
                          imageUrl: imageUrl,
                          content: content,
                          address: address,
                          contact: contact,
                          postId: postId,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
