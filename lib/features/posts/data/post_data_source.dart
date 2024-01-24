import 'package:charity_management_app/features/posts/data/post_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = FutureProvider<List<PostData>>(
  (ref) => PostDataSercice().getAllPost(),
);

final class PostDataSercice {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<PostData>> getAllPost() async {
    try {
      final listData = await _db.collection('posts').get();

      return listData.docs.map((e) => PostData.fromJson(e.data())).toList();
    } catch (e) {
      throw e;
    }
  }
}
