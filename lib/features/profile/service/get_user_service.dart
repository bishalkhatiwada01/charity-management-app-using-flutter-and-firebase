import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider =
    FutureProvider.autoDispose<DocumentSnapshot<Map<String, dynamic>>>(
        (ref) async {
  final getUserService = getUser();
  final userData = await getUserService.getUserDetails();
  return userData;
});

class getUser {
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    print("currentUser: ${currentUser}");
    if (currentUser != null) {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .get();
      return data;
    } else {
      // Handle the case when currentUser is null
      throw Exception('No current user');
    }
  }
}
