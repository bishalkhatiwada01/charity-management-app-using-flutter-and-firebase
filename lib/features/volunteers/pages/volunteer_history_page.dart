import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VolunteerHistoryPage extends StatelessWidget {
  final String currentUser = "user123";

  const VolunteerHistoryPage({super.key}); // Replace with actual user ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        title: Text(
          'Volunteer History',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('volunteerHistory')
            .where('volunteerId', isEqualTo: currentUser)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No volunteer history available.'));
          } else {
            List<Widget> volunteerHistoryList = snapshot.data!.docs.map((doc) {
              return ListTile(
                title: Text('Project Name: ${doc['projectName']}'),
                subtitle: Text('Date: ${doc['date']}'),
                // Add more fields as needed
              );
            }).toList();

            return ListView(
              children: volunteerHistoryList,
            );
          }
        },
      ),
    );
  }
}
