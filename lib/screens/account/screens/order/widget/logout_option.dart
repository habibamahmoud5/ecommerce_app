import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/login&signup/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutOption extends StatelessWidget {
  const LogoutOption({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showLogoutDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.logout, size: 24, color: AppColors.red),
            20.horizontalSpace,

            Text(
              'Logout',
              style: AppTextStyles.b1Regular.copyWith(color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/Warning.png', width: 78, height: 78),

              10.verticalSpace,

              Text(
                'Logout?',
                style: AppTextStyles.h4SemiBold.copyWith(
                  color: AppColors.black,
                ),
              ),

              8.verticalSpace,

              Text(
                'Are you sure you want to logout?',
                textAlign: TextAlign.center,
                style: AppTextStyles.b1Regular.copyWith(
                  color: AppColors.gray808,
                ),
              ),

              20.verticalSpace,

              SizedBox(
                width: 293.w,
                height: 54.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Yes, Logout',
                    style: AppTextStyles.b1Medium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

              10.verticalSpace,

              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: Text(
                    'No, Cancel',
                    style: AppTextStyles.b1Medium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
