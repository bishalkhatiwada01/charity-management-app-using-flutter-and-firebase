// ignore_for_file: use_build_context_synchronously

import 'package:charity_management_app/common/widgets/my_custom_button.dart';
import 'package:charity_management_app/features/auth/pages/login_page.dart';
import 'package:charity_management_app/features/auth/services/auth_service.dart';
import 'package:charity_management_app/features/auth/services/status_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _authService = AuthService();

  Future<void> _register() async {
    await _authService.register(
      _emailController.text,
      _passwordController.text,
      _firstnameController.text,
      _lastnameController.text,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const StatusPage()),
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/Avatar.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Image.asset("assets/objects.png"),
            DraggableScrollableSheet(
              initialChildSize: 0.65,
              maxChildSize: 0.8,
              minChildSize: 0.65,
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.only(top: 18, left: 40, right: 40),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    gradient: RadialGradient(
                      center: Alignment(0.7, -0.6),
                      radius: 0.5,
                      colors: [
                        Color.fromARGB(255, 36, 35, 37),
                        Color.fromRGBO(59, 54, 63, 1),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              " Lets Get Started",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 35.h),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "first name required!!";
                              }
                              return null;
                            },
                            controller: _firstnameController,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp, color: Colors.white60),
                              contentPadding: const EdgeInsets.only(left: 10),
                              prefixIcon: const Icon(
                                Icons.person_3_outlined,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white54),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.5),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "lastname required!!";
                              }
                              return null;
                            },
                            controller: _lastnameController,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                color: Colors.white60,
                                fontSize: 14.sp,
                              ),
                              contentPadding: const EdgeInsets.only(left: 10),
                              prefixIcon: const Icon(
                                Icons.person_3_outlined,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.5),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "email required!!";
                              }
                              return null;
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.white60,
                                fontSize: 14.sp,
                              ),
                              contentPadding: const EdgeInsets.all(10.0),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white54),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white.withOpacity(0.5),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "password required!!";
                                    }
                                    return null;
                                  },
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 14.sp,
                                    ),
                                    contentPadding: const EdgeInsets.all(10.0),
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                      onPressed: _togglePasswordVisibility,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white54),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "password required!!";
                                    } else if (_passwordController.text
                                            .trim() !=
                                        _confirmPasswordController.text
                                            .trim()) {
                                      return "Password doesnot match";
                                    }
                                    return null;
                                  },
                                  controller: _confirmPasswordController,
                                  obscureText: !_isConfirmPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    hintStyle: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 14.sp,
                                    ),
                                    contentPadding: const EdgeInsets.all(10.0),
                                    prefixIcon: const Icon(
                                      Icons.lock_outline,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isConfirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                      onPressed:
                                          _toggleConfirmPasswordVisibility,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white54),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          CustomLoginButton(
                              onPressed: _register, buttonText: "Signup"),
                          
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.purple[200],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
