import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/account_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarrScreen extends StatefulWidget {
  const BottomNavigationBarrScreen({super.key});

  @override
  State<BottomNavigationBarrScreen> createState() =>
      _BottomNavigationBarrScreenState();
}

class _BottomNavigationBarrScreenState
    extends State<BottomNavigationBarrScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    AccountScreen(),
    AccountScreen(),
    AccountScreen(),
    AccountScreen(),
    AccountScreen(),
  ];

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
