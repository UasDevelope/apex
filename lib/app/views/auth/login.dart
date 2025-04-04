import 'package:apex/app/utils/constants/assets.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/constants/color.dart';
import '../../widgets/text_field/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: AppSize.h2,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // App Logo
                  Image.asset(AppAssets.logo),
                  SizedBox(
                    height: AppSize.h2,
                  ),
                  // Email Field
                  CustomTextField(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),

                  // Password Field
                  CustomTextField(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) => value!.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
                  ),

                  // Login Button
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            title: "Login",
                            onPressed: () {
                              Get.toNamed(Routes.BOTTOMNAV);
                            }),
                      )
                    ],
                  ),

                  // Navigate to Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(Routes.signup);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColors.appColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
