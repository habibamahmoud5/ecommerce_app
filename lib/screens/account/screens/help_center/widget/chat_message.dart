import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSender;
  final String? time;

  const ChatMessage({
    super.key,
    required this.message,
    required this.isSender,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isSender
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: BubbleNormal(
            text: message,
            isSender: isSender,
            tail: true,
            color: isSender ? AppColors.black : AppColors.lightGray,
            textStyle: AppTextStyles.b2Regular.copyWith(
              color: isSender ? AppColors.white : AppColors.darkGray,
            ),
          ),
        ),

        if (time != null)
          Padding(
            padding: EdgeInsets.only(
              left: isSender ? 0 : 2.w,
              right: isSender ? 2.w : 0,
              top: 2.h,
            ),
            child: Text(
              time!,
              style: AppTextStyles.b3Regular.copyWith(color: AppColors.gray999),
            ),
          ),
      ],
    );
  }
}
