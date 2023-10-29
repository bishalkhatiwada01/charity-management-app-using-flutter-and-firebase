import 'package:authentication/views/auth/pages/signup_page.dart';
import 'package:authentication/views/auth/view_model/firebase_auth_service.dart';
import 'package:authentication/views/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Future<void> _showPasswordIncorrectDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Incorrect Password"),
          content: Text("The entered password is incorrect. Please try again."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF242121),
        body: Stack(
          fit: StackFit.loose,
          children: [
            Image.asset(
              "assets/Illustration.png",
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
                    padding:
                        const EdgeInsets.only(top: 30, left: 40, right: 40),
                    decoration: ShapeDecoration(
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
                                  "Welcome Back!",
                                  style: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 45.h),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 5),
                                child: Text(
                                  "Username",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "username required!!";
                                  }
                                },
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  hintText: '@username',
                                  hintStyle: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 14.sp,
                                  ),
                                  contentPadding: const EdgeInsets.all(14.0),
                                  prefixIcon: const Icon(
                                    Icons.person_3_outlined,
                                    color: Colors.white38,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white54),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white.withOpacity(0.5),
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                              ),
                              SizedBox(height: 25.h),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 5),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "password required!!";
                                        }
                                      },
                                      controller: _passwordController,
                                      obscureText: !_isPasswordVisible,
                                      decoration: InputDecoration(
                                        hintText: '  ⚪️⚪️⚪️⚪️⚪️⚪️⚪️',
                                        hintStyle: TextStyle(
                                          letterSpacing: 3,
                                          color: Colors.white54,
                                          fontSize: 6.sp,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(10.0),
                                        prefixIcon: const Icon(
                                          Icons.lock_outline,
                                          color: Colors.white38,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isPasswordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Colors.white38,
                                          ),
                                          onPressed: _togglePasswordVisibility,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white54),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              // InkWell(
                              //   onTap: () async {
                              //     if (formKey.currentState!.validate()) {

                              //       try {
                              //         await FirebaseAuth.instance
                              //             .createUserWithEmailAndPassword(
                              //           email: _usernameController.text,
                              //           password: _passwordController.text,
                              //         );

                              //         Navigator.pushReplacement(
                              //             context,
                              //             MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const HomePage(),
                              //             ));
                              //       } catch (e) {
                              //         if (kDebugMode) {
                              //           print(e);
                              //         }
                              //       }
                              //     }
                              //   },
                              //   child: Container(
                              //     width: 329.w,
                              //     height: 42.0.h,
                              //     decoration: BoxDecoration(
                              //       gradient: const LinearGradient(
                              //         colors: [
                              //           Color(0xFF9C3FE4),
                              //           Color(0xFFC65647)
                              //         ],
                              //       ),
                              //       borderRadius: BorderRadius.circular(8.0),
                              //     ),
                              //     child: const Center(
                              //       child: Text(
                              //         "Login",
                              //         style: TextStyle(fontSize: 14),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    final response = await FirebaseAuthService()
                                        .signInWithEmailAndPassword(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                    );
                                    if (response == "Login Successful") {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage(),
                                          ));
                                    } else {
                                      Fluttertoast.showToast(msg: response);
                                    }
                                  }
                                },
                                child: Text("Login"),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupPage()));
                                    },
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.purple[200],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
