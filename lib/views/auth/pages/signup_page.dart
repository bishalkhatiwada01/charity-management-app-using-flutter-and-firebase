// ignore_for_file: deprecated_member_use, unused_import


import 'package:authentication/views/auth/view_model/firebase_auth_service.dart';
import 'package:authentication/views/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242121),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                Image.asset(
                  "assets/fullback2.png",
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 902.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210, left: 43, right: 43),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          " Lets Get Started",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "  First Name",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "  Last Name",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: '@username',
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontSize: 12.sp,
                            ),
                            contentPadding: const EdgeInsets.all(10.0),
                            prefixIcon: const Icon(
                              Icons.person_3_outlined,
                              color: Colors.white38,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: '  ⚪️⚪️⚪️⚪️⚪️⚪️⚪️',
                                  hintStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 5.sp,
                                  ),
                                  contentPadding: const EdgeInsets.all(10.0),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.white38,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white38,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white30,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: '  ⚪️⚪️⚪️⚪️⚪️⚪️⚪️',
                                  hintStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 5.sp,
                                  ),
                                  contentPadding: const EdgeInsets.all(10.0),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.white38,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white38,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      InkWell(
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _usernameController.text,
                              password: _passwordController.text,
                            );

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ));
                          } catch (e) {
                            if (kDebugMode) {
                              print(e);
                            }
                          }
                        },
                        child: Container(
                          width: 329.w,
                          height: 42.0.h,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                            child: Text("Signup"),
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.purple[200],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
