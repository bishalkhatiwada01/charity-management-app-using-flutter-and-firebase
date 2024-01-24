
import 'package:charity_management_app/features/auth/pages/login_page.dart';
import 'package:charity_management_app/features/notifications/notification_page.dart';
import 'package:charity_management_app/features/profile/pages/profile_page.dart';
import 'package:charity_management_app/features/volunteers/pages/application_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Future<String> userSignout() async {
      try {
        await FirebaseAuth.instance.signOut();
        return "Success";
      } on FirebaseAuthException catch (e) {
        return "${e.message}";
      }
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // drawer header
          DrawerHeader(
            child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          SizedBox(
            height: 15.h,
          ),

          // home tile
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('H O M E'),
              onTap: () {
                // navigate to home page
                Navigator.pop(context);
              },
            ),
          ),

          // profile tile
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('P R O F I L E'),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // navigate to profile page
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ),

          // user tile
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: ListTile(
              leading: const Icon(
                Icons.newspaper_outlined,
              ),
              title: const Text('N O T I F I C A T I O N '),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // navigate to home page
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationPage()));
              },
            ),
          ),

          // Applications
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: ListTile(
              leading: const Icon(
                Icons.newspaper_outlined,
              ),
              title: const Text(
                'APPLICATIONS',
                style: TextStyle(
                  letterSpacing: 4,
                ),
              ),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                // navigate to ApplicationPage
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => ApplicationListPage()));
              },
            ),
          ),

          // logout tile
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('L O G O U T'),
              onTap: () async {
                String result = await userSignout();
                if (result == "Success") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
