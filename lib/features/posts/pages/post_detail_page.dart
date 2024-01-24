
import 'package:charity_management_app/features/posts/widgets/donate_button.dart';
import 'package:charity_management_app/features/posts/widgets/volunteer_button.dart';
import 'package:charity_management_app/features/volunteers/pages/send_application_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PostDetailsPage extends StatefulWidget {
  final String headline;
  final String content;
  final String address;
  final String contact;
  final String imageUrl;
  final String date;
  final String postId;

  const PostDetailsPage({
    super.key, 
    required this.headline,
    required this.content,
    required this.address,
    required this.contact,
    required this.imageUrl,
    required this.date,
    required this.postId,
  });

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  // for delete data
  void _deletePost(BuildContext context) async {
    try {
      // Delete the post from Firestore
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.postId)
          .delete();

      // Navigate back to the homepage after successful deletion
      Navigator.pop(context);
    } catch (error) {
      // Handle any errors that may occur during the deletion
      print('Error deleting post: $error');
      // Optionally, show a snackbar or alert the user about the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: const Text(
          'POSTS DETAILS',
          style: TextStyle(letterSpacing: 4),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: Image.network(
                  widget.imageUrl,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.headline,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Address: ',
                            style: TextStyle(
                              color:
                              Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(text: '${widget.address}',style: TextStyle(
                            color:
                            Theme.of(context).colorScheme.inversePrimary,
                          ),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Date: ',
                            style: TextStyle(
                              color:
                              Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(text: '${widget.date}',style: TextStyle(
                            color:
                            Theme.of(context).colorScheme.inversePrimary,
                          ),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Contact no: ',
                            style: TextStyle(
                              color:
                              Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(text: '${widget.contact}',
                          style: TextStyle(
                            color:
                            Theme.of(context).colorScheme.inversePrimary,
                          ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Discreption:',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${widget.content}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 16.0),
                      VolunteerButton(
                        onVolunteerPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VolunteerApplicationPage(
                                      postId: widget.postId,
                                    )));
                            
                        }
                      ),
                      SizedBox(width: 16.0),
                      DonateButton(
                        onDonatePressed: () {
                          // Implement the logic for donation
                        },
                      ),
                    ],
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
