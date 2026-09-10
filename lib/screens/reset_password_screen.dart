import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/widgets/app_buttom.dart';
import 'package:ecommerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  void showPasswordChangedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Check Image
              Image.asset(
                'assets/images/Check-duotone.png',
                width: 78,
                height: 78,
              ),

              const SizedBox(height: 10),

              Text(
                'Password Changed!',
                textAlign: TextAlign.center,
                style: AppTextStyles.h4SemiBold.copyWith(
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 8),

              // Message
              Text(
                'You can now use your new password to login to your account.',
                textAlign: TextAlign.center,
                style: AppTextStyles.b1Regular.copyWith(
                  color: AppColors.gray808,
                ),
              ),

              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // Close Dialog
                    Navigator.pop(context);

                    // Go to Login Screen
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: AppTextStyles.b1Medium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: AppColors.black,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Title
                    Text(
                      'Reset Password',
                      style: AppTextStyles.h2SemiBold.copyWith(
                        color: AppColors.black,
                      ),
                    ),

                    const SizedBox(height: 3),

                    // Description
                    Text(
                      'Set the new password for your account so you\ncan login and access all the features.',
                      style: AppTextStyles.b1Regular.copyWith(
                        color: AppColors.gray808,
                      ),
                    ),

                    const SizedBox(height: 20),

                    CustomTextField(
                      label: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your password';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }

                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return 'Password must contain a lowercase letter';
                        }

                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'Password must contain an uppercase letter';
                        }

                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Password must contain a number';
                        }

                        return null;
                      },
                      hintText: 'Enter your password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    CustomTextField(
                      label: 'Confirm Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm your password';
                        }

                        return null;
                      },
                      hintText: 'Enter your password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 20),

                    AppButtom(
                      text: 'Continue',
                      backgroundColor: AppColors.black,
                      foregroundColor: AppColors.white,
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        if (_formKey.currentState!.validate()) {
                          showPasswordChangedDialog(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
