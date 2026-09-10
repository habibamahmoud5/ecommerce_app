import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/customer_service_screen.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:ecommerce_app/widgets/help_center_option.dart';
import 'package:flutter/material.dart';

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
                      size: 20,
                      color: Color(0xff181725),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Divider(color: AppColors.lightGray, thickness: 1.20),
                HelpCenterOption(
                  icon: 'assets/images/Headphones.png',
                  title: 'Customer Service',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerServiceScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 5),
                HelpCenterOption(
                  icon: 'assets/images/Whatsapp.png',
                  title: 'Whatsapp',
                ),
                SizedBox(height: 5),
                HelpCenterOption(
                  icon: 'assets/images/Web.png',
                  title: 'Website',
                ),

                SizedBox(height: 5),
                HelpCenterOption(
                  icon: 'assets/images/Facebook (1).png',
                  title: 'Facebook',
                ),
                SizedBox(height: 5),
                HelpCenterOption(
                  icon: 'assets/images/Twitter.png',
                  title: 'Twitter',
                ),
                SizedBox(height: 5),
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
