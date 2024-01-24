
import 'package:charity_management_app/features/profile/widgets/my_profile_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key, required String title});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  // current logged in user
  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser)
        .get();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PERSONAL INFORMATION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
            letterSpacing: 1,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // error
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          // data received
          else if (snapshot.hasData) {
            // extract data
            Map<String, dynamic>? user = snapshot.data?.data();

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    UserTextField(
                      label: 'First Name',
                      initialValue: "${user?['firstname']} ",
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    UserTextField(
                      label: 'Last Name',
                      initialValue: " ${user?['lastname']}",
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    UserTextField(
                      label: 'Address',
                      initialValue: "${user?['address']}",
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    UserTextField(
                      label: 'Qualification',
                      initialValue: "${user?['qualification']}",
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    UserTextField(
                      label: 'Interest',
                      initialValue: "${user?['interest']}",
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    UserTextField(
                      label: 'Skills',
                      initialValue: "${user?['skills']}",
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    UserTextField(
                      label: 'Contact Info',
                      initialValue: "${user?['contactno']}",
                      textColor: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('No data');
          }
        },
      ),
    );
  }
}
