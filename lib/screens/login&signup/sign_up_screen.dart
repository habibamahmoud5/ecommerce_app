import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/core/validators.dart';
import 'package:ecommerce_app/screens/bottom_navigation_barr_screen.dart';
import 'package:ecommerce_app/screens/login&signup/login_screen.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/auth_divider.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/auth_header.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/authfooter.dart';
import 'package:ecommerce_app/screens/login&signup/widgets/social_auth_button.dart';
import 'package:ecommerce_app/widgets/app_buttom.dart';
import 'package:ecommerce_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
                      title: 'Create an account',
                      subtitle: 'Let’s create your account.',
                    ),
                    20.verticalSpace,
                    CustomTextField(
                      label: 'Full Name',
                      validator: AppValidators.fullName,
                      hintText: 'Enter your full name',
                    ),
                    10.verticalSpace,
                    CustomTextField(
                      label: 'Email',
                      hintText: 'Enter your email address',

                      validator: AppValidators.email,
                    ),
                    10.verticalSpace,

                    CustomTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      obscureText: true,
                      validator: AppValidators.password,
                    ),
                    12.verticalSpace,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.b2Regular.copyWith(
                          color: AppColors.black,
                        ),
                        children: [
                          const TextSpan(
                            text: 'By signing up you agree to our ',
                          ),
                          TextSpan(
                            text: 'Terms',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ', '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ',\nand '),
                          TextSpan(
                            text: 'Cookie Use',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    24.verticalSpace,
                    AppButtom(
                      text: 'Create an Account',
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
                      message: 'Already have an account?',
                      actionText: 'Log In',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
