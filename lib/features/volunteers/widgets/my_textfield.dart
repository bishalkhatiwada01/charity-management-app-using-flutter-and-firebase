import 'package:flutter/material.dart';

class CustomTextFieldVolunteer extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final FormFieldValidator<String>? validator;

  CustomTextFieldVolunteer({
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
