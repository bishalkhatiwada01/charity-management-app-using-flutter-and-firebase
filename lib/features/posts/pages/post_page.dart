import 'package:charity_management_app/common/widgets/my_drawer.dart';
import 'package:charity_management_app/features/posts/data/post_data_source.dart';
import 'package:charity_management_app/features/posts/widgets/post_card..dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  // firestore access
  // text controller
  final TextEditingController newPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postData = ref.watch(postProvider);
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
        body: postData.when(
          data: (data) {
            return data.isEmpty
                ? Text('No posts')
                : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                        return PostCard(
                        postData: data[index],
                        );
                      },
                    );
          },
          error: (e, s) => Center(
            child: Text(e.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
