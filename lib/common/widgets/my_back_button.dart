import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        padding: EdgeInsets.all(10.sp),
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
