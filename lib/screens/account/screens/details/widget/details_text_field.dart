import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;

  const DetailsTextField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
        ),

        5.verticalSpace,

        SizedBox(
          height: 52.h,
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
            keyboardType: keyboardType,
            style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
            decoration: InputDecoration(
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, size: 24.sp, color: AppColors.gray999)
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 14.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColors.grayB3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
