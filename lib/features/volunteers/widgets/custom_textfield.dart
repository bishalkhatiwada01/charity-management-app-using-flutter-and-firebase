import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextField({
    required this.labelText,
    this.controller,
    this.validator,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary, // Change this color to your desired color
        ),
      ),      validator: validator,
      onSaved: onSaved,
    );
  }
}
