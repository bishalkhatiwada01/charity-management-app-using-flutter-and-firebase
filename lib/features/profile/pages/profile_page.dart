import 'dart:io';
import 'package:charity_management_app/features/profile/pages/donation_history_page.dart';
import 'package:charity_management_app/features/profile/pages/profile_details_page.dart';
import 'package:charity_management_app/features/profile/widgets/my_profile_listtile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!.uid;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser)
        .get();
    return data;
  }
  Future<void> _uploadImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      try {
        await _storage.ref('uploads/$currentUser/profile.jpg').putFile(file);
      } on FirebaseException catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
            letterSpacing: 4,
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

          // data recieved
          else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data?.data();

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 25.h),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60.0, // Adjust the radius as needed
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Icon(
                            Icons.person,
                            size: 60.sp,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: _uploadImage,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 12.0, // Adjust the radius as needed
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondary, // Change color as needed
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user?['firstname'] ?? 'default name',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          user?['lastname'] ?? 'default name',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    MyProfileListTile(
                      title: 'Personal Information',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const ProfileDetails(title: '')));
                      },
                    ),
                    MyProfileListTile(
                      title: 'Donation History',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DonationHistoryPage()));
                      },
                    ),
                    MyProfileListTile(
                      title: 'Volunteer History',
                      onTap: () {},
                    ),
                    MyProfileListTile(
                      title: 'Payment Information',
                      onTap: () {},
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
