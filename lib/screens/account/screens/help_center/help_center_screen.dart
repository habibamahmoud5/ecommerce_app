import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/bottom_navigation_barr_screen.dart';
import 'package:ecommerce_app/screens/account/screens/help_center/customer_service_screen.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:ecommerce_app/screens/account/screens/help_center/widget/help_center_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

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
                  title: 'Help Center',
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
                      size: 24,
                      color: Color(0xff181725),
                    ),
                  ),
                ),

                10.verticalSpace,
                Divider(color: AppColors.lightGray, thickness: 1.20),
                HelpCenterOption(
                  icon: 'assets/images/Headphones.png',
                  title: 'Customer Service',
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => const CustomerServiceScreen(),
                      ),
                    );
                  },
                ),
                5.verticalSpace,
                HelpCenterOption(
                  icon: 'assets/images/Whatsapp.png',
                  title: 'Whatsapp',
                ),
                5.verticalSpace,
                HelpCenterOption(
                  icon: 'assets/images/Web.png',
                  title: 'Website',
                ),

                5.verticalSpace,
                HelpCenterOption(
                  icon: 'assets/images/Facebook (1).png',
                  title: 'Facebook',
                ),
                5.verticalSpace,
                HelpCenterOption(
                  icon: 'assets/images/Twitter.png',
                  title: 'Twitter',
                ),
                5.verticalSpace,
                HelpCenterOption(
                  icon: 'assets/images/Instagram.png',
                  title: 'Instagram',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
