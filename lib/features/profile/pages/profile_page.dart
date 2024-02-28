import 'package:charity_management_app/features/donate/donation_history_page.dart';
import 'package:charity_management_app/features/profile/pages/profile_details_page.dart';
import 'package:charity_management_app/features/profile/service/get_user_service.dart';
import 'package:charity_management_app/features/profile/widgets/my_card_profile.dart';
import 'package:charity_management_app/features/volunteers/pages/application_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userDataAsyncValue = ref.watch(userProvider);
    print(userDataAsyncValue);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              letterSpacing: 4),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      body: userDataAsyncValue.when(
        data: (userData) {
          final Map<String, dynamic> user = userData.data()!;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: AssetImage("assets/6195145.jpg"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/download.png"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/GooglePlus-logo-red.png"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/1_Twitter-new-icon-mobile-app.jpg"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/600px-LinkedIn_logo_initials.png"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user['firstname'] + ' ' + user['lastname'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 22),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user['email'],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      // cards for profile
                      MyCardProfile(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileDetails(
                                        user: user,
                                      )));
                        },
                        title: 'Personal Information',
                        leading: const Icon(
                          Icons.privacy_tip_sharp,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      MyCardProfile(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DonationHistoryPage(),
                            ),
                          );
                        },
                        title: 'Donation History',
                        leading: const Icon(
                          Icons.history,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      MyCardProfile(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplicationsPage()));
                        },
                        title: 'Volunteer History',
                        leading: const Icon(
                          Icons.history,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      MyCardProfile(
                        onPressed: () {
                          Navigator.pushNamed(context, '/help-support');
                        },
                        title: 'Help & Support',
                        leading: const Icon(
                          Icons.help_outline,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      MyCardProfile(
                        onPressed: () {
                          Share.share('https://charitymanagementapp.com');
                        },
                        title: 'Invite a Friend',
                        leading: const Icon(
                          Icons.add_reaction_sharp,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      MyCardProfile(
                        onPressed: () {
                          Navigator.pushNamed(context, '/logout');
                        },
                        title: 'Logout',
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 6.h),

                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return null;
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
