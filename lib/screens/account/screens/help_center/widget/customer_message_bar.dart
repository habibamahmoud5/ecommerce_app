import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class CustomerMessageBar extends StatelessWidget {
  const CustomerMessageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: MessageBar(
        messageBarStyle: MessageBarStyle(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.lightGray, width: 2.w),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.lightGray, width: 2.w),
          ),

          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 14.h,
          ),
        ),

        onSend: (message) {},

        sendButton: Container(
          width: 52.w,
          height: 52.h,
          decoration: BoxDecoration(
            color: AppColors.black,

            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(Icons.mic_none, color: AppColors.white, size: 24.sp),
        ),

        messageBarHintText: 'Write your message...',
        messageBarColor: AppColors.white,

        messageBarHintStyle: AppTextStyles.b2Regular.copyWith(
          color: AppColors.gray999,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
