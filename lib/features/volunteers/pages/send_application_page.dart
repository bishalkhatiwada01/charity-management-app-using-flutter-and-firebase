import 'package:charity_management_app/common/widgets/my_button.dart';
import 'package:charity_management_app/features/volunteers/widgets/custom_textfield.dart';
import 'package:charity_management_app/features/volunteers/widgets/editable_input_chip.dart';

import 'package:charity_management_app/features/volunteers/widgets/my_experience_button.dart';
import 'package:charity_management_app/features/volunteers/widgets/my_interest_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VolunteerApplicationPage extends StatefulWidget {
  final String postId;

  const VolunteerApplicationPage({
    super.key,
    required this.postId,
  });
  @override
  // ignore: library_private_types_in_public_api
  _VolunteerApplicationPageState createState() =>
      _VolunteerApplicationPageState();
}

class _VolunteerApplicationPageState extends State<VolunteerApplicationPage> {
  


  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  List<String> selectedInterests = [];
  List<String> selectedSkills = [];
  String? _selectedExperience;

  Future<void> _submitApplication() async {
    if (_formKey.currentState!.validate()) {
      String userId = FirebaseAuth.instance.currentUser!.uid;

      _formKey.currentState!.save();

      try {
        await _firestore.collection('volunteer_applications').add({
          'volunteerFullName': _fullNameController.text,
          'volunteerEmail': _emailController.text,
          'volunteerContactNumber': _contactNumberController.text,
          'volunteerAddress': _addressController.text,
          'volunteerQualification': _qualificationController.text,
          'volunteerSkills': selectedSkills,
          'volunteerInterests': selectedInterests,
          'volunteerDate': DateTime.now().toIso8601String(),
          'userId': userId,
          'postId': widget.postId,
          'volunteerExperience': _selectedExperience,
        });

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Application submitted successfully')),
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit application: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _contactNumberController.dispose();
    _addressController.dispose();
    _qualificationController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          'Volunteer Application',
          style: TextStyle(
            letterSpacing: 3,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: 'Full Name',
                  controller: _fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'Contact No',
                  controller: _contactNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'Address',
                  controller: _addressController,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'Qualification',
                  controller: _qualificationController,
                ),
                SizedBox(height: 20.h),
                EditableChipField(
                  initialValues: selectedSkills,
                  onChanged: (List<String> items) {
                    
                    setState(() {
                      selectedSkills = items;
                    });
                  },
                ),

                SizedBox(height: 20.h),
                InterestDropdownWithChipSelector(
                  availableInterests: const [
                    'Teaching',
                    'Fundraising',
                    'Marketing',
                    'Social Media',
                    'Event Management',
                    'Content Writing',
                    'Photography',
                    'Video Editing',
                    'Graphic Designing',
                    'Web Development',
                    'App Development',
                    'UI/UX Designing',
                    'Data Entry',
                    'Translation',
                    'Other',
                  ],
                  selectedInterests: selectedInterests,
                  onSelectionChanged: (selected) {
                    setState(() {
                      selectedInterests = selected;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                MyExperienceDropDownButton(
                  onExperienceChanged: (selectedExperience) {
                    setState(() {
                      _selectedExperience = selectedExperience;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                MyButton(
                  text: 'Submit',
                  onTap: _submitApplication,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
