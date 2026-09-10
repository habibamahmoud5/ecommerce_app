import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/faqas_screen.dart';
import 'package:ecommerce_app/screens/help_center_screen.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/widgets/account_option.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25, bottom: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBarText(
                  title: 'Account',
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: AppColors.black,
                    ),
                  ),
                  action: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 20,
                      color: Color(0xff181725),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Divider(color: AppColors.lightGray, thickness: 1.20),
                AccountOption(
                  icon: Icons.shopping_bag_outlined,
                  title: 'My Orders',
                ),
                Divider(color: AppColors.lightGray, thickness: 8),

                AccountOption(
                  icon: Icons.person_outline_outlined,
                  title: 'My Details',
                ),
                Divider(color: AppColors.lightGray, thickness: 1.20),

                AccountOption(icon: Icons.home_outlined, title: 'Address Book'),
                Divider(color: AppColors.lightGray, thickness: 1.20),

                AccountOption(
                  icon: Icons.payment_rounded,
                  title: 'Payment Methods',
                ),
                Divider(color: AppColors.lightGray, thickness: 1.20),

                AccountOption(
                  icon: Icons.notifications_none,
                  title: 'Notifications',
                ),
                Divider(color: AppColors.lightGray, thickness: 10),

                AccountOption(
                  icon: Icons.help_outline_outlined,
                  title: 'FAQs ',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FaqasScreen()),
                    );
                  },
                ),
                Divider(color: AppColors.lightGray, thickness: 1.20),

                AccountOption(
                  icon: Icons.headset_mic_outlined,
                  title: 'Help Center',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpCenterScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: AppColors.lightGray, thickness: 8),

                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/Warning.png',
                                width: 78,
                                height: 78,
                              ),

                              const SizedBox(height: 10),

                              Text(
                                'Logout?',
                                style: AppTextStyles.h4SemiBold.copyWith(
                                  color: AppColors.black,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                'Are you sure you want to logout?',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.b1Regular.copyWith(
                                  color: AppColors.gray808,
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Yes, Logout
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
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

                              const SizedBox(height: 10),

                              // No, Cancel
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
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
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 24, color: AppColors.red),
                        const SizedBox(width: 20),

                        Text(
                          'Logout',
                          style: AppTextStyles.b1Regular.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
