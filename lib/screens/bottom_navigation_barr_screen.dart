import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:ecommerce_app/screens/discover_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/saved_items_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarrScreen extends StatefulWidget {
  final int initialIndex;

  const BottomNavigationBarrScreen({super.key, this.initialIndex = 0});

  @override
  State<BottomNavigationBarrScreen> createState() =>
      _BottomNavigationBarrScreenState();
}

class _BottomNavigationBarrScreenState
    extends State<BottomNavigationBarrScreen> {
  late int currentIndex;

  List<Widget> screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    SavedItemsScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.gray999,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
