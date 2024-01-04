// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:authentication/features/Auth/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Other properties and methods for the home page...

  Future<String> userSignout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return "${e.message}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String result = await userSignout();
            if (result == "Success") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            } else {}
          },
          child: const Text("Sign Out"),
        ),
      ),
    );
  }
}
