import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/clothes_model.dart';
import 'package:ecommerce_app/screens/checkout_screen.dart';
import 'package:ecommerce_app/widgets/invoice.dart';
import 'package:ecommerce_app/widgets/product_in_cart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back, size: 30),
                      Text("My Cart", style: AppTextStyles.h3SemiBold),
                      Icon(Icons.notifications, size: 30),
                    ],
                  ),
                  SizedBox(height: 20),
                  ProductInCart(product: products[0]),
                  ProductInCart(product: products[1]),
                  ProductInCart(product: products[2]),
                  SizedBox(height: 10,),
                  Invoice(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 25,
            left: 25,
            child: InkWell(
              onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutScreen(),
              ),
            );
              },
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Go To Checkout",style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight(600),color: Colors.white),),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_forward,color: Colors.white,)
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

List<ClothesModel> products = [
  ClothesModel(
    image: "assets/purple_t-shirt.png",
    name: "Regular Fit Slogan",
    size: "Size L",
    price: 1190,
  ),//0
  ClothesModel(
    image: "assets/blue_t-shirt.png",
    name: "Regular Fit Polo",
    size: "Size M",
    price: 1000,
  ),//1
  ClothesModel(
    image: "assets/brown_t-shirt.png",
    name: "Regular Fit Black",
    size: "Size L",
    price: 1290,
  ),//2
];
