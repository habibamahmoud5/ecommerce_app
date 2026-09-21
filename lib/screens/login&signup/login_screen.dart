import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/core/validators.dart';
import 'package:ecommerce_app/screens/bottom_navigation_barr_screen.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/auth_divider.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/auth_header.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/authfooter.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/social_auth_button.dart';
import 'package:ecommerce_app/screens/cart/screen/reset_password_screen.dart';
import 'package:ecommerce_app/screens/login&signup/sign_up_screen.dart';
import 'package:ecommerce_app/widgets/app_buttom.dart';
import 'package:ecommerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

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
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(
                      title: 'Login to your account',
                      subtitle: 'It’s great to see you again.',
                    ),
                    20.verticalSpace,

                    CustomTextField(
                      label: 'Email',
                      hintText: 'Enter your email address',

                      validator: AppValidators.email,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      obscureText: true,
                      validator: AppValidators.password,
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Forgot your password?',
                          style: AppTextStyles.b2Regular.copyWith(
                            color: AppColors.gray808,
                          ),
                        ),
                        SizedBox(width: 5),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            ' Reset your password',
                            style: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    AppButtom(
                      text: 'Login',
                      backgroundColor: AppColors.black,
                      foregroundColor: AppColors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBarrScreen(
                                    initialIndex: 0,
                                  ),
                            ),
                          );
                        }
                      },
                    ),
                    24.verticalSpace,
                    const AuthDivider(),
                    24.verticalSpace,
                    SocialAuthButton(
                      text: 'Sign Up with Google',
                      imagePath: 'assets/images/logos_google-icon.png',
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      side: BorderSide(color: AppColors.lightGray),
                      onPressed: () {},
                    ),
                    16.verticalSpace,
                    SocialAuthButton(
                      text: 'Sign Up with Facebook',
                      imagePath: 'assets/images/facebook.png',
                      backgroundColor: AppColors.blue,
                      foregroundColor: AppColors.white,
                      onPressed: () {},
                    ),
                    20.verticalSpace,
                    AuthFooter(
                      message: 'Don’t have an account?',
                      actionText: 'Join',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
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
