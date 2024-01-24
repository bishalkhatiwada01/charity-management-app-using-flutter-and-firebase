import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Color textColor;

  UserTextField({
    required this.label,
    required this.initialValue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextFormField(
        initialValue: initialValue,
        readOnly: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
          labelText: label,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textColor), // Set the desired color
            borderRadius: BorderRadius.circular(10.w),
          ),
        ),
        style: TextStyle(color: textColor), // Set the desired color
      ),
    );
  }
}
