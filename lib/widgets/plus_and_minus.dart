import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/clothes_model.dart';
import 'package:ecommerce_app/screens/cart.dart';
import 'package:flutter/material.dart';

class PlusAndMinus extends StatefulWidget {
  // int myCount;
  final ClothesModel clothesModel;
  static int subTotal = preSum.reduce((a, b) => a + b);
  static int shippingFee = 80;
  static List<int> preSum = products
      .map(((e) => (e.price ?? 0) * e.count))
      .toList();
  static int total = 0;
  const PlusAndMinus({super.key, required this.clothesModel});

  @override
  State<PlusAndMinus> createState() => _PlusAndMinusState();
}

class _PlusAndMinusState extends State<PlusAndMinus> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 73,
      height: 23,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (widget.clothesModel.count > 0) {
                  widget.clothesModel.count--;
                }
                PlusAndMinus.preSum = products
                    .map(((e) => (e.price ?? 0) * e.count))
                    .toList();
                PlusAndMinus.subTotal = PlusAndMinus.preSum.reduce(
                  (a, b) => a + b,
                );
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: AppColors.grayCC),
              ),
              child: Center(child: Icon(Icons.remove)),
            ),
          ),
          Text("${widget.clothesModel.count}", style: AppTextStyles.b3Medium),
          InkWell(
            onTap: () {
              setState(() {
                widget.clothesModel.count++;
                PlusAndMinus.preSum = products
                    .map(((e) => (e.price ?? 0) * e.count))
                    .toList();
                PlusAndMinus.subTotal = PlusAndMinus.preSum.reduce(
                  (a, b) => a + b,
                );
                PlusAndMinus.total =
                    PlusAndMinus.subTotal + PlusAndMinus.shippingFee;
                // print();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: AppColors.grayCC),
              ),
              child: Center(child: Icon(Icons.add)),
            ),
          ),
        ],
      ),
    );
  }
}
