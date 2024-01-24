import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomLoginButton(
      {super.key, required this.onPressed, this.buttonText = "Login"});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 52.0,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
