// import 'package:authentication/features/volunteers/try/data_model.dart';
// import 'package:authentication/features/volunteers/try/application_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ApplicationsListPage extends StatelessWidget {
//   // final String postId;

//   // ApplicationsListPage({required this.postId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Volunteer Applications'),
//       ),
//       body: FutureBuilder(
//         future: _fetchApplications(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // Loading indicator
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             List<VolunteerApplication>? applications = snapshot.data;
//             return ListView.builder(
//               itemCount: applications?.length,
//               itemBuilder: (context, index) {
//                 return VolunteerApplicationWidget(
//                   application: applications![index],
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<List<VolunteerApplication>> _fetchApplications() async {
//     // Fetch data from Firebase and return a list of VolunteerApplication objects
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('volunteer_applications')
//         .get();

//     return querySnapshot.docs
//         .map((doc) =>
//             VolunteerApplication.fromMap(doc.data() as Map<String, dynamic>))
//         .toList();
//   }
// }
