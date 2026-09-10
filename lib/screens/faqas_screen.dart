import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/account_option.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';

class FaqasScreen extends StatelessWidget {
  const FaqasScreen({super.key});

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
                  title: 'FAQs',
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
                ),
                Divider(color: AppColors.lightGray, thickness: 1.20),

                AccountOption(
                  icon: Icons.headset_mic_outlined,
                  title: 'Help Center',
                ),
                Divider(color: AppColors.lightGray, thickness: 8),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
