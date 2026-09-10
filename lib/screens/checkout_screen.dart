import 'dart:ui';

import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/address_screen.dart';
import 'package:ecommerce_app/widgets/address_in_checkout.dart';
import 'package:ecommerce_app/widgets/invoice.dart';
import 'package:ecommerce_app/widgets/payment_methods.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Checkout", style: AppTextStyles.h3SemiBold),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, size: 30),
          ),
          actions: const [
            Icon(Icons.notifications, size: 30),
            SizedBox(width: 25),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24),
                  Divider(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Delivery Address", style: AppTextStyles.h4SemiBold),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddressScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight(500),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AddressInCheckout(),
                  SizedBox(height: 20),
                  Divider(),
                  Text("Payment Method", style: AppTextStyles.b1SemiBold),
                  SizedBox(height: 16),
                  PaymentMethods(),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE6E6E6)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/visa.png",
                              width: 44,
                              height: 14,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              "  **** **** **** 2512",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight(600),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.edit, size: 28),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 20),
                  Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight(600)),
                  ),
                  SizedBox(height: 16),
                  Invoice(),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 249,
                        child: Container(
                          margin: EdgeInsets.only(right: 4),
                          height: 52,
                          child: TextFormField(
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                              prefixIcon: Icon(Icons.loyalty),
                              hintText: "Enter promo code",
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 84,
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 52,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight(500),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 27,
                right: 0,
                left: 0,
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(600),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
