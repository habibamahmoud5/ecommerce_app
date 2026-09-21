import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h2SemiBold.copyWith(color: AppColors.black),
        ),
        8.verticalSpace,
        Text(
          subtitle,
          style: AppTextStyles.b1Regular.copyWith(color: AppColors.gray808),
        ),
      ],
    );
  }
}
