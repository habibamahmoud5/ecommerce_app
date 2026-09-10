import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? action;

  const AppBarText({super.key, required this.title, this.leading, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) leading! else const SizedBox(width: 48),

        Expanded(
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.h3SemiBold.copyWith(color: AppColors.black),
            ),
          ),
        ),

        if (action != null) action! else const SizedBox(width: 48),
      ],
    );
  }
}
