import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class AccountOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const AccountOption({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(icon, size: 24, color: AppColors.black),

              const SizedBox(width: 20),

              Text(
                title,
                style: AppTextStyles.b1Regular.copyWith(color: AppColors.black),
              ),

              const Spacer(),

              GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.chevron_right,
                  size: 24,
                  color: AppColors.grayB3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
