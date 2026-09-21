import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPhoneField extends StatelessWidget {
  final TextEditingController controller;

  const DetailsPhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
        ),

        5.verticalSpace,

        Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGray),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/united states.png',
                width: 24,
                height: 24,
              ),

              6.horizontalSpace,

              Icon(
                Icons.keyboard_arrow_down,
                size: 14.sp,
                color: AppColors.black,
              ),

              12.horizontalSpace,

              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  style: AppTextStyles.b1Medium.copyWith(
                    color: AppColors.black,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
