import 'dart:async';

import 'package:charity_management_app/features/posts/data/post_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'volunteer_data_model.dart';

final volunteerApplicationProvider = FutureProvider<List<VolunteerApplication>>(
  (ref) => DataService().getApplication(),
);

final class DataService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<VolunteerApplication>> getApplication() async {
    try {
      final listData = await _db.collection('volunteer_applications').get();

      final applicationList = await Future.wait(listData.docs.map((e) async {
        final json = e.data();
        final volunteer = await getVolunteer(json['userId']);
        final post = await getPost(json['postId']);
        return VolunteerApplication.fromJson({
          ...json,
          'volunteer': volunteer,
          'posts': post,
        });
      }));
      return applicationList;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<Volunteer> getVolunteer(String volunteerId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> volunteer =
          await _db.collection('users').doc(volunteerId).get();
      final userV = Volunteer.fromJson(
          {...volunteer.data()!, 'volunteerId': volunteerId});

      return userV;
    } on FirebaseException {
      rethrow;
    }
  }

  Future<Post> getPost(String postId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> post =
          await _db.collection('posts').doc(postId).get();

      final postData = Post.fromJson({...post.data()!, 'postId': postId});
      return postData;
    } on FirebaseException {
      rethrow;
    }
  }
}
