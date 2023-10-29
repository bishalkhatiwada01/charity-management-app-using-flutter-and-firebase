import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String username, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: username, password: password);
      return credential.user;
    } catch (e) {
      if (kDebugMode) {
        print("Some error occured");
      }
    }
    return null;
  }

  Future<String> signInWithEmailAndPassword(
      {required String username, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      return "Login Successful";
    } on FirebaseAuthException catch (e) {
      return "${e.message}";
    }
  }

  Future<String> userSignout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return "${e.message}";
    }
  }
}
