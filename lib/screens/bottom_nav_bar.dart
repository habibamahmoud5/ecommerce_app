import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/cart.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currntIndex= 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body:Cart(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.gray999,
          currentIndex: currntIndex,
          selectedItemColor: AppColors.black,
          onTap: (value) {
            setState(() {
              currntIndex=value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon:Icon(Icons.home) ,
              label: "home"
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.search) ,
              label: "search"
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.favorite) ,
              label: "saved"
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.shopping_cart) ,
              label: "cart"
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.account_circle) ,
              label: "account"
            ),
          ],
          selectedLabelStyle:TextStyle(fontSize: 12,fontWeight: FontWeight(500
          ),color: AppColors.black),
          unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight(500
          ),color: AppColors.gray999),
        ),
      ),
    );
  }
}