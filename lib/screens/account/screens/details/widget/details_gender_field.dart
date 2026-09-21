import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsGenderField extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String?> onChanged;

  const DetailsGenderField({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
        ),

        5.verticalSpace,

        Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGray),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedGender,
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 24.sp,
                color: AppColors.black,
              ),
              style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
