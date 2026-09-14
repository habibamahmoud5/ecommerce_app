import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 18, 20, 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBarText(
                    title: 'Search',
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

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 52,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightGray),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            style: AppTextStyles.b1Regular.copyWith(
                              color: AppColors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search for clothes...',
                              hintStyle: AppTextStyles.b1Regular.copyWith(
                                color: AppColors.gray999,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 24,
                                color: AppColors.grayB3,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mic_none,
                                  size: 24,
                                  color: AppColors.grayB3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Recent Searches',
                        style: AppTextStyles.h4SemiBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Clear all',

                        style: AppTextStyles.b2SemiBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Jeans',
                        style: AppTextStyles.b1Regular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.cancel_outlined,
                        size: 24,
                        color: AppColors.gray999,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xffE2E2E2), thickness: 1.20),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Casual clothes',
                        style: AppTextStyles.b1Regular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.cancel_outlined,
                        size: 24,
                        color: AppColors.gray999,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xffE2E2E2), thickness: 1.20),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Hoodie',
                        style: AppTextStyles.b1Regular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.cancel_outlined,
                        size: 24,
                        color: AppColors.gray999,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xffE2E2E2), thickness: 1.20),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Nike shoes black',
                        style: AppTextStyles.b1Regular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.cancel_outlined,
                        size: 24,
                        color: AppColors.gray999,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xffE2E2E2), thickness: 1.20),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'V-neck tshirt',
                        style: AppTextStyles.b1Regular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.cancel_outlined,
                        size: 24,
                        color: AppColors.gray999,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xffE2E2E2), thickness: 1.20),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Winter clothes',
                        style: AppTextStyles.b1Regular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.cancel_outlined,
                        size: 24,
                        color: AppColors.gray999,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xffE2E2E2), thickness: 1.20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
