import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/account/screens/order/screen/Myorders_ongoing_completed_screen.dart';
import 'package:ecommerce_app/screens/account/screens/order/widget/logout_option.dart';
import 'package:ecommerce_app/screens/account/screens/details/details_screen.dart';
import 'package:ecommerce_app/screens/account/screens/faqs/faqas_screen.dart';
import 'package:ecommerce_app/screens/account/screens/help_center/help_center_screen.dart';
import 'package:ecommerce_app/screens/notification/notifications_screen.dart';
import 'package:ecommerce_app/screens/account/widgets/account_option.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 24,
                      color: Color(0xff181725),
                    ),
                  ),
                ),

                10.verticalSpace,
                Divider(color: AppColors.lightGray, thickness: 1.20),
                AccountOption(
                  icon: Icons.shopping_bag_outlined,
                  title: 'My Orders',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyOrdersScreen()),
                    );
                  },
                ),
                Divider(color: AppColors.lightGray, thickness: 8),

                AccountOption(
                  icon: Icons.person_outline_outlined,
                  title: 'My Details',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyDetailsScreen(),
                      ),
                    );
                  },
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
                    Navigator.push(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpCenterScreen(),
                      ),
                    );
                  },
                ),
                Divider(color: AppColors.lightGray, thickness: 8),

                10.verticalSpace,
                LogoutOption(),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
