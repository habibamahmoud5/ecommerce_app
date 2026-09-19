import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/home/widget/category_list.dart';
import 'package:ecommerce_app/screens/home/widget/home_header.dart';
import 'package:ecommerce_app/screens/home/widget/product_grid.dart';
import 'package:ecommerce_app/screens/home/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      'image': 'assets/images/product 1.png',
      'name': 'Regular Fit Polo',
      'price': '1,341',
      'oldPrice': null,
      'discount': null,
    },
    {
      'image': 'assets/images/product2.png',
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
            const HomeHeader(),

            16.verticalSpace,

            const SearchBarWidget(),

            16.verticalSpace,

            CategoryList(
              categories: categories,
              selectedCategory: selectedCategory,

              onCategorySelected: (index) {
                setState(() {
                  selectedCategory = index;
                });
              },
            ),

            24.verticalSpace,

            Expanded(child: ProductGrid(products: products)),
          ],
        ),
      ),
    );
  }
}
