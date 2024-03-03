import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'volunteer_data_model.dart';

final volunteerApplicationProvider = FutureProvider<List<VolunteerApplication>>(
  (ref) => VolunteerDataService().getApplication(),
);

final class VolunteerDataService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> submitApplication({
    required String fullName,
    required String email,
    required String contactNumber,
    required String address,
    required List<String> qualification,
    required List<String> skills,
    required List<String> interests,
    required String userId,
    required String postId,
    required String? experience,
  }) async {
    final token = await FirebaseMessaging.instance.getToken();
    await _db.collection('volunteer_applications').add({
      'volunteerFullName': fullName,
      'volunteerEmail': email,
      'volunteerContactNumber': contactNumber,
      'volunteerAddress': address,
      'volunteerQualification': qualification,
      'volunteerSkills': skills,
      'volunteerInterests': interests,
      'volunteerDate': DateTime.now().toIso8601String(),
      'userId': userId,
      'postId': postId,
      'volunteerExperience': experience,
      'acceptedApplicationId': "",
      'userToken': token,
    });
  }

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
