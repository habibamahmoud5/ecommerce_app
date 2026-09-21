import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/home/widget/filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 52.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightGray),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: AppTextStyles.b1Regular.copyWith(color: AppColors.black),
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
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),

          8.horizontalSpace,
          Container(
            width: 52.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return const FilterSheet();
                  },
                );
              },
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.tune, color: AppColors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
