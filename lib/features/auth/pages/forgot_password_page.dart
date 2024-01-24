// import 'package:authentication/features/auth/pages/sign_up_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ForgotPasswordPage extends StatefulWidget {
//   const ForgotPasswordPage({super.key});

//   @override
//   State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
// }

// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String _message = '';
//   void _resetPassword() async {
//     try {
//       await _auth.sendPasswordResetEmail(email: _emailController.text);
//       setState(() {
//         _message = "Password reset email sent. Check your email.";
//       });
//     } catch (e) {
//       setState(() {
//         _message = "Error: ${e.toString()}";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leadingWidth: 50.w,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Text(
//               "Forgot password",
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 fontFamily: 'Montserrat',
//                 fontStyle: FontStyle.normal,
//                 fontSize: 27.sp,
//               ),
//             ),
//           ),
//           centerTitle: true,
//           leading: Stack(
//             children: [
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 10.w, top: 10.w),
//                     child: Container(
//                       width: 40.w,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                             color: const Color.fromARGB(255, 255, 255, 255),
//                             width: 2.0),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(),
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.arrow_back_ios,
//                             size: 30.sp,
//                             color: const Color.fromARGB(255, 255, 255, 255),
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 42),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 80.h,
//                   ),
//                   Text(
//                     "Enter Email Address",
//                     style: TextStyle(
//                       color: const Color.fromARGB(255, 255, 255, 255),
//                       fontFamily: 'Montserrat',
//                       fontStyle: FontStyle.normal,
//                       fontSize: 25.sp,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   Container(
//                     height: 55.h,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: const Color.fromARGB(255, 239, 239, 239),
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     child: TextFormField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         hintText: '        example@gmail.com',
//                         hintStyle: TextStyle(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           fontFamily: 'Montserrat',
//                         ),
//                         contentPadding: EdgeInsets.all(16.0),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.transparent),
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.transparent),
//                         ),
//                       ),
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Montserrat',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       "Back to login",
//                       style: TextStyle(
//                           fontFamily: 'Montserrat',
//                           color: Colors.white,
//                           fontSize: 22.sp),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   SizedBox(
//                     height: 55.h,
//                     width: double.infinity,
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.horizontal(
//                         left: Radius.circular(30.0),
//                         right: Radius.circular(30.0),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: _resetPassword,
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                             const Color.fromARGB(255, 81, 18, 163),
//                           ),
//                         ),
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(fontSize: 16.sp),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   const Text(
//                     "Or don't have an account?",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30.h,
//                   ),
//                   SizedBox(
//                     height: 55.h,
//                     width: double.infinity,
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.horizontal(
//                         left: Radius.circular(30.0),
//                         right: Radius.circular(30.0),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => const RegisterPage()));
//                         },
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(
//                             Colors.white,
//                           ),
//                         ),
//                         child: Text(
//                           'Sign up',
//                           style:
//                               TextStyle(fontSize: 16.sp, color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:charity_management_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _resetPassword() async {
    await _authService.resetPassword(_emailController.text);

    // Show a message to the user
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset email sent')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          ElevatedButton(
            onPressed: _resetPassword,
            child: const Text('Reset Password'),
          ),
        ],
      ),
    );
  }
}
