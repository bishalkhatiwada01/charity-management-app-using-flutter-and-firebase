
import 'package:charity_management_app/common/widgets/my_custom_button.dart';
import 'package:charity_management_app/features/auth/pages/forgot_password_page.dart';
import 'package:charity_management_app/features/auth/pages/sign_up_page.dart';
import 'package:charity_management_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {}

    await _authService.login(
      _emailController.text,
      _passwordController.text,
    );
  }

  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
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
                  padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
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
                              "Welcome Back!",
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 45.h),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "email required!!";
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                            controller: _emailController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white60,
                              ),
                              contentPadding: const EdgeInsets.all(14.0),
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
                          SizedBox(height: 25.h),
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
                                    return null;
                                  },
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: '  ⚪️⚪️⚪️⚪️⚪️⚪️⚪️',
                                    hintStyle: TextStyle(
                                      letterSpacing: 3,
                                      fontSize: 6.sp,
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white60,
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
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                fillColor: MaterialStateProperty.all<Color>(
                                    Colors.purple[100]!),
                                checkColor: Colors.white,
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;

                                    SharedPreferences.getInstance()
                                        .then((prefs) {
                                      prefs.setBool('rememberMe', value);
                                    });
                                  });
                                },
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Remember Me",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 32.w,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgotPasswordPage()));
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.purple[200],
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          CustomLoginButton(
                            onPressed: _login,
                            buttonText: 'Login',
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
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
