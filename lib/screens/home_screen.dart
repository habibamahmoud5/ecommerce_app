import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/filter_sheet.dart';
import 'package:ecommerce_app/widgets/prouduct_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All',
    'T-shirts',
    'Jeans',
    'Shoes',
    'shorts',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/product 1.png',
      'name': 'Regular Fit Slogan',
      'price': '1,190',
      'oldPrice': null,
      'discount': null,
    },
    {
      'image': 'assets/images/product2.png',
      'name': 'Regular Fit Polo',
      'price': '1,100',
      'oldPrice': '1,200',
      'discount': '-52%',
    },
    {
      'image': 'assets/images/product3.png',
      'name': 'Regular Fit Black',
      'price': '1,690',
      'oldPrice': null,
      'discount': null,
    },
    {
      'image': 'assets/images/product4.png',
      'name': 'Regular Fit V-Neck',
      'price': '1,290',
      'oldPrice': null,
      'discount': null,
    },
    {
      'image': 'assets/images/product5.png',
      'name': 'Regular Fit Polo',
      'price': '1,341',
      'oldPrice': null,
      'discount': null,
    },
    {
      'image': 'assets/images/product6.png',
      'name': 'Regular Fit Shirt',
      'price': '1,250',
      'oldPrice': null,
      'discount': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Discover',
                      style: AppTextStyles.h2SemiBold.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.notifications_none,
                      size: 24,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  Container(
                    width: 52,
                    height: 52,
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
                      icon: const Icon(
                        Icons.tune,
                        color: AppColors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

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

            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductContainer(
                    image: product['image'],
                    name: product['name'],
                    price: product['price'],
                    oldPrice: product['oldPrice'],
                    discount: product['discount'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
