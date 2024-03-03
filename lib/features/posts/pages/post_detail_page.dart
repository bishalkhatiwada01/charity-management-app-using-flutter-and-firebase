import 'package:charity_management_app/common/functions/date.dart';
import 'package:charity_management_app/common/widgets/custom_app_bar.dart';

import 'package:charity_management_app/features/posts/data/post_data_model.dart';
import 'package:charity_management_app/features/posts/pages/full_screen_image.dart';
import 'package:charity_management_app/features/posts/widgets/donate_button.dart';
import 'package:charity_management_app/features/posts/widgets/volunteer_button.dart';
import 'package:charity_management_app/features/volunteers/pages/send_application_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class PostDetailsPage extends ConsumerStatefulWidget {
  final PostData postModel;

  const PostDetailsPage({
    super.key,
    required this.postModel,
  });

  @override
  ConsumerState<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ConsumerState<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.postModel);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'POST DETAILS',
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
              GestureDetector(
                onTap: () {
                  // Handle onTap event to navigate to full-screen image page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(
                        imageUrl: widget.postModel.postImageUrl!,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12.0)),
                  child: Image.network(
                    widget.postModel.postImageUrl!,
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                            text: formatDateTime(
                              widget.postModel.postDate,
                            ),
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
                            onDonatePressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  final TextEditingController amountController =
                                      TextEditingController();
                                  return AlertDialog(
                                    title: Text(
                                      'Enter amount to pay',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                      ),
                                    ),
                                    content: TextField(
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
                                        labelText: 'Enter amount',
                                        labelStyle: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          'Pay',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ),
                                        onPressed: () {
                                          int amount =
                                              int.parse(amountController.text);
                                          payWithKhaltiInApp(amount);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
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

  final currentUser = FirebaseAuth.instance.currentUser!.uid;

  void payWithKhaltiInApp(int amount) {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: amount * 100,
          productIdentity: "User ID ${currentUser}",
          productName: "User Name ${widget.postModel.postHeadline}"),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    final firestoreInstance = FirebaseFirestore.instance;

    firestoreInstance.collection('donations').add({
      'userId': currentUser,
      'postTitle': widget.postModel.postHeadline,
      'amount': success.amount / 100,
      'transactionId': success.idx,
      'paymentDate': DateTime.now(),
      'postId': widget.postModel.postId,
    }).then((value) {
      if (kDebugMode) {
        print("Payment Added");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("Failed to add payment: $error");
      }
    });

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("Payment successful"),
            actions: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              )
            ],
          );
        });
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint("Failure: ${failure.message}");
  }

  void onCancel() {
    debugPrint("Cancelled");
  }
}
