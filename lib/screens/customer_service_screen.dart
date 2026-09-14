import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';

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

                const SizedBox(height: 5),

                const Divider(
                  color: AppColors.lightGray,
                  thickness: 1.2,
                  height: 1,
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // TODAY
                        Center(
                          child: DateChip(
                            date: DateTime.now(),
                            color: AppColors.lightGray,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: BubbleNormal(
                            text: 'Hello, good morning.',
                            isSender: false,
                            tail: true,
                            color: AppColors.lightGray,
                            textStyle: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.darkGray,
                            ),
                          ),
                        ),

                        const SizedBox(height: 4),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: BubbleNormal(
                            text:
                                'I am a Customer Service, is there\nanything I can help you with?',
                            isSender: false,
                            tail: true,
                            color: AppColors.lightGray,
                            textStyle: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.darkGray,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 2, top: 2),
                          child: Text(
                            '10:41 pm',
                            style: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.gray999,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Align(
                          alignment: Alignment.centerRight,
                          child: BubbleNormal(
                            text:
                                "Hi, I'm having problems with my\norder & payment.",
                            isSender: true,
                            tail: true,
                            color: AppColors.black,
                            textStyle: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 4),

                        Align(
                          alignment: Alignment.centerRight,
                          child: BubbleNormal(
                            text: 'Can you help me?',
                            isSender: true,
                            tail: true,
                            color: AppColors.black,
                            textStyle: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 2, top: 2),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '10:50 pm',
                              style: AppTextStyles.b2Regular.copyWith(
                                color: AppColors.gray999,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: BubbleNormal(
                            text: 'Of course...',
                            isSender: false,
                            tail: true,
                            color: AppColors.lightGray,
                            textStyle: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.darkGray,
                            ),
                          ),
                        ),

                        const SizedBox(height: 4),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: BubbleNormal(
                            text:
                                'Can you tell me the\nproblem you are having? So I can\nhelp solve it.',
                            isSender: false,
                            tail: true,
                            color: AppColors.lightGray,
                            textStyle: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.darkGray,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 2, top: 2),
                          child: Text(
                            '10:51 pm',
                            style: AppTextStyles.b2Regular.copyWith(
                              color: AppColors.gray999,
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: MessageBar(
                    onSend: (message) {},
                    sendButton: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.mic_none,
                        color: AppColors.white,
                        size: 24,
                      ),
                    ),
                    actions: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.image_outlined,
                          color: AppColors.gray999,
                          size: 24,
                        ),
                      ),
                    ],
                    messageBarHintText: 'Write your message...',
                    messageBarColor: AppColors.white,
                    messageBarHintStyle: AppTextStyles.b2Regular.copyWith(
                      color: AppColors.gray999,
                    ),
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
