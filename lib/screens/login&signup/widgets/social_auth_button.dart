import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;
  final BorderSide? side;

  const SocialAuthButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: side ?? BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 24.w, height: 24.h),
            SizedBox(width: 8.w),
            Text(
              text,
              style: AppTextStyles.b1Medium.copyWith(color: foregroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
