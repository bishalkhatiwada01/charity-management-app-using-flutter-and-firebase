import 'package:charity_management_app/common/functions/date.dart';
import 'package:charity_management_app/features/volunteers/data/volunteer_data_source.dart';
import 'package:charity_management_app/features/volunteers/pages/my_application_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationsPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends ConsumerState<ApplicationsPage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    final applicationList = ref.watch(volunteerApplicationProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text(
          'My Applications',
          style: TextStyle(letterSpacing: 4),
        ),
      ),
      body: applicationList.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final application = data[index];
              if (application.userId == uid) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                  child: Card(
                    elevation: 5.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(100, 102, 106, 0.894)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: const EdgeInsets.only(right: 12.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              right:
                                  BorderSide(width: 1.0, color: Colors.white24),
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage(application.post.postImageUrl),
                          ),
                        ),
                        title: Text(
                          application.post.postHeadline,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              application.post.postAddress,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              formatDateTime(application.volunteerCreatedAt),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ApplicationDetailPage(
                                application: application,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else {
                const Center(child: Text("No Application Found"));
              }
              return null;
            },
          );
        },
        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
