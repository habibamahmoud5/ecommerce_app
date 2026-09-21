import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/home/widget/category_list.dart';
import 'package:ecommerce_app/screens/home/widget/home_header.dart';
import 'package:ecommerce_app/screens/home/widget/product_grid.dart';
import 'package:ecommerce_app/screens/home/widget/search_bar.dart';
import 'package:ecommerce_app/screens/saved/widget/saved_item_product.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  int selectedCategory = 0;

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
        child: Padding(
          padding: EdgeInsets.only(top: 25, bottom: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBarText(
                  title: 'Saved Items',
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

                SavedItemProduct(products: products),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
