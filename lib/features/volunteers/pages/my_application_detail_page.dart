import 'package:charity_management_app/common/functions/date.dart';
import 'package:charity_management_app/features/posts/data/post_data_model.dart';
import 'package:charity_management_app/features/volunteers/data/volunteer_data_model.dart';
import 'package:charity_management_app/features/volunteers/widgets/label_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationDetailPage extends ConsumerStatefulWidget {
  final VolunteerApplication application;
  final PostData? postModel;

  const ApplicationDetailPage({
    super.key,
    required this.application,
    this.postModel,
  });

  @override
  ConsumerState<ApplicationDetailPage> createState() =>
      _ApplicationDetailPageState();
}

class _ApplicationDetailPageState extends ConsumerState<ApplicationDetailPage> {
  @override
  Widget build(BuildContext context) {
    final applicationData = widget.application;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          'APPLICATION DETAILS',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
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
                  applicationData.post.postImageUrl,
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
                    SizedBox(height: 20.h),
                    Text(
                      'Applicants Details: ',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Name',
                      value: applicationData.volunteerName,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                        label: 'Applied Date',
                        value: applicationData.volunteerCreatedAt),
                    SizedBox(height: 8.h),
                    LabelValueWidget(
                      label: 'Email',
                      value: applicationData.volunteerEmail,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Address',
                      value: applicationData.volunteerAddress,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Contact No. :',
                      value: applicationData.volunteerContactNum,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Experience',
                      value: applicationData.volunteerExperience,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Qualification',
                      value: applicationData.volunteerQualification!.join(', '),
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Skills',
                      value: applicationData.volunteerSkills!.join(', '),
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Interest',
                      value: applicationData.volunteerInterests!.join(', '),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          'Post Details: ',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    LabelValueWidget(
                      label: 'Title',
                      value: applicationData.post.postHeadline,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Address',
                      value: applicationData.post.postAddress,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Date',
                      value: applicationData.post.postDate,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Description',
                      value: applicationData.post.postContent,
                    ),
                    const SizedBox(height: 8.0),
                    LabelValueWidget(
                      label: 'Time',
                      value: formatDateTime(applicationData.post.postDate),
                    ),
                    const SizedBox(height: 8.0),

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
