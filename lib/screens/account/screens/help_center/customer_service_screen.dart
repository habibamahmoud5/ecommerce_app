import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/account/screens/help_center/widget/chat_message.dart';
import 'package:ecommerce_app/screens/account/screens/help_center/widget/customer_message_bar.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: AppBarText(
                    title: 'Customer Service',
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
                        Icons.phone_outlined,
                        size: 20,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),

                5.verticalSpace,
                const Divider(
                  color: AppColors.lightGray,
                  thickness: 1.2,
                  height: 1,
                ),
                5.verticalSpace,
                Center(
                  child: DateChip(
                    date: DateTime.now(),
                    color: AppColors.lightGray,
                  ),
                ),
                10.verticalSpace,
                const ChatMessage(
                  message: 'Hello, good morning.',
                  isSender: false,
                ),

                8.verticalSpace,

                const ChatMessage(
                  message:
                      'I am a Customer Service, is there\nanything I can help you with?',
                  isSender: false,
                  time: '10:41 pm',
                ),

                20.verticalSpace,

                const ChatMessage(
                  message: "Hi, I'm having problems with my\norder & payment.",
                  isSender: true,
                ),

                8.verticalSpace,

                const ChatMessage(
                  message: 'Can you help me?',
                  isSender: true,
                  time: '10:50 pm',
                ),

                20.verticalSpace,

                const ChatMessage(message: 'Of course...', isSender: false),

                8.verticalSpace,

                const ChatMessage(
                  message:
                      'Can you tell me the\nproblem you are having? So I can\nhelp solve it.',
                  isSender: false,
                  time: '10:51 pm',
                ),
                Spacer(),
                const CustomerMessageBar(),
                8.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
