import 'package:charity_management_app/features/posts/data/post_data_model.dart';
import 'package:charity_management_app/features/posts/widgets/donate_button.dart';
import 'package:charity_management_app/features/posts/widgets/volunteer_button.dart';
import 'package:charity_management_app/features/volunteers/pages/send_application_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailsPage extends StatefulWidget {
  final PostData postModel;

  const PostDetailsPage({
    super.key,
    required this.postModel,
  });

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  // for delete data

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
          style: TextStyle(
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
          ),
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
                  widget.postModel.postImageUrl!,
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
                      widget.postModel.postHeadline,
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
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: widget.postModel.postAddress,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          )
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
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: widget.postModel.postDate,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          )
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
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: widget.postModel.postContact,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Description: ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: widget.postModel.postContent,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: ExpansionTile(
                        iconColor: Theme.of(context).colorScheme.inversePrimary,
                        tilePadding: EdgeInsets.symmetric(horizontal: 8.w),
                        shape: const BeveledRectangleBorder(
                          side: BorderSide.none,
                        ),
                        title: Text(
                          'For Volunteer:',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Interests: ',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.postModel.interests
                                            .join(", "),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Qualifications: ',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.postModel.qualifications
                                            .join(", "),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Skills: ',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            widget.postModel.skills.join(", "),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 16.0),
                          VolunteerButton(onVolunteerPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VolunteerApplicationPage(
                                      postId: widget.postModel.postId,
                                    )));
                          }),
                          const SizedBox(width: 16.0),
                          DonateButton(
                            onDonatePressed: () {},
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
