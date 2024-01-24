import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ApplicationsPage extends StatefulWidget {
  @override
  _ApplicationsPageState createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  final _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getPostData(String postId) async {
    return await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('volunteer_applications').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];
              DateTime date = (doc['date'] as Timestamp).toDate();
              String formattedDate = DateFormat('dd/MM/yyyy').format(date);

              return Card(
                child: ListTile(
                  title: FutureBuilder(
                    future: getPostData(doc['postId']),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading...');
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Text(
                              'Post Headline: ${snapshot.data!['headline']}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                      FontWeight.bold), // Make the font bigger
                            ),
                            if (snapshot.data!['imageUrl'] != null)
                              Container(
                                height: 400.h,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  child: Image.network(
                                    snapshot.data!['imageUrl'],
                                  ),
                                ),
                              ),
                          ],
                        );
                      } else {
                        return Text('No data');
                      }
                    },
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name: ${doc['fullName']}'),
                      Text('Email: ${doc['email']}'),
                      Text('Contact Number: ${doc['contactNumber']}'),
                      Text('Address: ${doc['address']}'),
                      Text('Qualification: ${doc['qualification']}'),
                      Text('Skills: ${doc['skills']}'),
                      Text('Interests: ${doc['interests'].join(', ')}'),
                      Text('Date of Submission: $formattedDate'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
