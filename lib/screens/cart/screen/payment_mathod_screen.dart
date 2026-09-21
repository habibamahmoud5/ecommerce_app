import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/payment_mathod_model.dart';
import 'package:ecommerce_app/screens/cart/screen/new_card_screen.dart';
import 'package:ecommerce_app/screens/cart/widgets/payment_mathod_container.dart';
import 'package:flutter/material.dart';

class PaymentMathodScreen extends StatefulWidget {
  const PaymentMathodScreen({super.key});

  @override
  State<PaymentMathodScreen> createState() => _PaymentMathodScreenState();
}

class _PaymentMathodScreenState extends State<PaymentMathodScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,

          title: Text("Payment Method", style: AppTextStyles.h3SemiBold),

          centerTitle: true,

          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, size: 30),
          ),

          actions: const [
            Icon(Icons.notifications_none, size: 30),

            SizedBox(width: 25),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Saved Cards",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  for (int i = 0; i < paymentMethods.length; i++)
                    Column(
                      children: [
                        PaymentMathodContainer(
                          onTap: () {
                            setState(() {
                              isSelected = i;
                            });
                          },

                          paymentMathod: paymentMethods[i],

                          isSelected: isSelected == i,
                        ),

                        SizedBox(height: 12),
                      ],
                    ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCardScreen(),
                        ),
                      );
                    },

                    child: Container(
                      height: 54,

                      decoration: BoxDecoration(
                        // color: AppColors.black,
                        border: Border.all(color: Color(0xffCCCCCC)),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Icon(Icons.add),

                          SizedBox(width: 10),

                          Text(
                            "Add New Card",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 27,
                left: 0,
                right: 0,

                child: Container(
                  height: 54,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    color: AppColors.black,
                  ),

                  child: Center(
                    child: Text(
                      "Apply",
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
        ),
      ),
    );
  }
}

List<PaymentMathodModel> paymentMethods = [
  PaymentMathodModel(
    image: "assets/images/visa.png",
    number: "**** **** **** 2512",
  ),
  PaymentMathodModel(
    image: "assets/images/unknown.png",
    number: "**** **** **** 5421",
  ),
  PaymentMathodModel(
    image: "assets/images/visa.png",
    number: "**** **** **** 2512",
  ),
];
