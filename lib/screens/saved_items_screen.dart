import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/models/clothes_model.dart';
import 'package:ecommerce_app/widgets/saved_item.dart';
import 'package:flutter/material.dart';

class SavedItemsScreen extends StatelessWidget {
  // int savedItemsCount = products
  //     .map((ele) {
  //       if (ele.isSaved!) {
  //         return ele;
  //       }
  //     })
  //     .toList()
  //     .length;
  // int get savedItemsCount2 => savedItemsCount % 2 == 0
  //     ? savedItemsCount
  //     : savedItemsCount + 1;
  SavedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back, size: 30),
                Text("Saved Items", style: AppTextStyles.h3SemiBold),
                Icon(Icons.notifications_none, size: 30),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 172 * 3 + 24 * 2,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                spacing: 15,
                children: [
                  for (int i = 0; i < products.length; i++)
                    if (products[i].isSaved!) SavedItem(product: products[i]),
                  // SavedItem(product: products[1]),
                  // SavedItem(product: products[2]),
                  // SavedItem(product: products[0]),
                  // SavedItem(product: products[1]),
                  // SavedItem(product: products[2]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// (savedItemsCount.toDouble()/2*172)+((savedItemsCount.toDouble()/2)-1)*24
List<ClothesModel> products = [
  ClothesModel(
    image: "assets/images/product 1.png",
    name: "Regular Fit Slogan",
    size: "Size L",
    price: 1190,
    isSaved: true,
  ), //0
  ClothesModel(
    image: "assets/images/product2.png",
    name: "Regular Fit Polo",
    size: "Size M",
    price: 1000,
    isSaved: true,
  ), //1
  ClothesModel(
    image: "assets/images/product3.png",
    name: "Regular Fit Black",
    size: "Size L",
    price: 1290,
    isSaved: true,
  ), //2
  ClothesModel(
    image: "assets/images/product4.png",
    name: "Regular Fit V-Neck",
    // size: "Size L",
    price: 1190,
    isSaved: true,
  ), //3
  ClothesModel(
    image: "assets/images/product 1.png",
    name: "Regular Fit Slogan",
    // size: "Size L",
    price: 1190,
    isSaved: true,
  ), //4
  ClothesModel(
    image: "assets/images/product2.png",
    name: "Regular Fit Slogan",
    // size: "Size L",
    price: 1190,
    isSaved: true,
  ), //5
];
