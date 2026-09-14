import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/clothes_model.dart';
import 'package:ecommerce_app/models/invoice_class.dart';
import 'package:ecommerce_app/screens/checkout_screen.dart';
import 'package:ecommerce_app/widgets/invoice.dart';
import 'package:ecommerce_app/widgets/product_in_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static final InvoiceClass myclass = InvoiceClass();
  const CartScreen({super.key});

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
                      Icon(Icons.notifications_none, size: 30),
                    ],
                  ),
                  SizedBox(height: 20),
                  for (int i = 0; i < cartProducts.length; i++)
                    ProductInCart(product: cartProducts[i], myclass: myclass),

                  SizedBox(height: 10),
                  Invoice(myclass1: myclass),
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Go To Checkout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(600),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<ClothesModel> cartProducts = [
  ClothesModel(
    image: "assets/images/product 1.png",
    name: "Regular Fit Slogan",
    size: "Size L",
    price: 1190,
    // isSaved: true
  ), //0
  ClothesModel(
    image: "assets/images/product2.png",
    name: "Regular Fit Polo",
    size: "Size M",
    price: 1000,
    // isSaved: true
  ), //1
  ClothesModel(
    image: "assets/images/product3.png",
    name: "Regular Fit Black",
    size: "Size L",
    price: 1290,
    // isSaved: true
  ), //2
];
