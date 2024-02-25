import 'package:charity_management_app/common/widgets/my_button.dart';
import 'package:charity_management_app/features/volunteers/data/volunteer_data_source.dart';
import 'package:charity_management_app/features/volunteers/widgets/custom_textfield.dart';
import 'package:charity_management_app/features/volunteers/widgets/my_experience_button.dart';
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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController volunteerSkillsController =
      TextEditingController();
  final TextEditingController volunteerQualifiController =
      TextEditingController();
  final TextEditingController volunteerIntersController =
      TextEditingController();

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
        await VolunteerDataService().submitApplication(
          fullName: _fullNameController.text,
          email: _emailController.text,
          contactNumber: _contactNumberController.text,
          address: _addressController.text,
          interests: volunteerSkillsController.text.split(','),
          qualification: volunteerQualifiController.text.split(','),
          skills: volunteerIntersController.text.split(','),
          userId: userId,
          postId: widget.postId,
          experience: _selectedExperience,
        );

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
    volunteerSkillsController.dispose();
    volunteerQualifiController.dispose();
    volunteerIntersController.dispose();
    super.dispose();
  }

  String? _validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
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
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: 'Full Name',
                  controller: _fullNameController,
                  validator: _validateTextField,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  validator: _validateTextField,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'Contact No',
                  controller: _contactNumberController,
                  validator: _validateTextField,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  labelText: 'Address',
                  controller: _addressController,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  validator: _validateTextField,
                  controller: volunteerSkillsController,
                  labelText: 'Skills',
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  validator: _validateTextField,
                  controller: volunteerQualifiController,
                  labelText: 'Qualifications',
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  validator: _validateTextField,
                  controller: volunteerIntersController,
                  labelText: 'Interests',
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
