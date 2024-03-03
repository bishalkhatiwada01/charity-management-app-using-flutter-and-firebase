import 'package:charity_management_app/common/widgets/custom_app_bar.dart';
import 'package:charity_management_app/common/widgets/my_drawer.dart';
import 'package:charity_management_app/features/posts/data/post_data_source.dart';
import 'package:charity_management_app/features/posts/widgets/post_card..dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  final TextEditingController newPostController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final postData = ref.watch(postProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(
          title: 'POSTS',
        ),
        drawer: const MyDrawer(),
        body: postData.when(
          data: (data) {
            return data.isEmpty
                ? const Text('No posts')
                : RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(postProvider);
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final posts = data[index];

                        return PostCard(
                          postData: posts,
                        );
                      },
                    ),
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
