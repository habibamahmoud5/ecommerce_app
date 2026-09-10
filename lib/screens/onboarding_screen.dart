import 'package:ecommerce_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/app_buttom.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/Element 2.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 24,
                    left: 14,
                    right: 14,
                    child: Text(
                      'Define \nyourself in\nyour unique\nway.',
                      style: AppTextStyles.h1SemiBold.copyWith(
                        color: AppColors.black,
                        height: 0.80,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/Image_onboarding.png',
                      height: 650,
                      width: 340,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 22, 25, 22),
              child: AppButtom(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                icon: Icons.arrow_forward,
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
