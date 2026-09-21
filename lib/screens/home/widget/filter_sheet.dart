import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/app_buttom.dart';
import 'package:flutter/material.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int selectedCategory = 0;
  RangeValues priceRange = const RangeValues(0, 19);
  final List<String> categories = [
    'Relevance',
    'Price: Low - High',
    'Price: High - Low',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: AppTextStyles.h4SemiBold.copyWith(
                  color: AppColors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, size: 24),
              ),
            ],
          ),

          Divider(color: Color(0xffE2E2E2), thickness: 1.20),
          Text(
            'Sort By',
            style: AppTextStyles.b1SemiBold.copyWith(color: AppColors.black),
          ),

          SizedBox(height: 12),
          SizedBox(
            height: 36,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final isSelected = selectedCategory == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.black : AppColors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.black
                            : AppColors.lightGray,
                      ),
                    ),
                    child: Text(
                      categories[index],
                      style: AppTextStyles.b1Medium.copyWith(
                        color: isSelected ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(color: Color(0xffE2E2E2), thickness: 1.20),
          Row(
            children: [
              Text(
                'Price',
                style: AppTextStyles.b1SemiBold.copyWith(
                  color: AppColors.black,
                ),
              ),
              Spacer(),
              Text(
                '\$${priceRange.start.round()} - \$${priceRange.end.round()}',
                style: AppTextStyles.b1Regular.copyWith(
                  color: AppColors.gray999,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),
          RangeSlider(
            values: priceRange,
            min: 0,
            max: 19,
            divisions: 19,
            activeColor: AppColors.black,

            onChanged: (value) {
              setState(() {
                priceRange = value;
              });
            },
          ),
          SizedBox(height: 12),
          Divider(color: Color(0xffE2E2E2), thickness: 1.20),
          Row(
            children: [
              Text(
                'Size',
                style: AppTextStyles.b1SemiBold.copyWith(
                  color: AppColors.black,
                ),
              ),
              Spacer(),
              Text(
                'L',
                style: AppTextStyles.b1SemiBold.copyWith(
                  color: AppColors.gray999,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          AppButtom(
            text: 'Apply Filters',
            backgroundColor: AppColors.black,
            foregroundColor: AppColors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
