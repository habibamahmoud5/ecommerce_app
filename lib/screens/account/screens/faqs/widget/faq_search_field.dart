import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqSearchField extends StatelessWidget {
  const FaqSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        style: AppTextStyles.b1Regular.copyWith(color: AppColors.black),
        decoration: InputDecoration(
          hintText: 'Search for questions...',
          hintStyle: AppTextStyles.b1Regular.copyWith(color: AppColors.gray999),
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
            color: AppColors.gray999,
          ),
          suffixIcon: const Icon(
            Icons.mic_none,
            size: 24,
            color: AppColors.gray999,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
    );
  }
}
