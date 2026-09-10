import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/plus_and_minus.dart';
import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  // int subTotal = subTotal2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Sub-total",
              style: TextStyle(
                fontWeight: FontWeight(600),
                color: AppColors.gray808,
              ),
            ),
            Text("\$ ${PlusAndMinus.subTotal}", style: AppTextStyles.b1Medium),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "VAT (%)",
              style: TextStyle(
                fontWeight: FontWeight(600),
                color: AppColors.gray808,
              ),
            ),
            Text("\$ 0.0", style: AppTextStyles.b1Medium),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Shipping fee",
              style: TextStyle(
                fontWeight: FontWeight(600),
                color: AppColors.gray808,
              ),
            ),
            Text("\$ ${PlusAndMinus. shippingFee}", style: AppTextStyles.b1Medium),
          ],
        ),
        SizedBox(height: 16),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Total",
              style: TextStyle(
                fontWeight: FontWeight(600),
                // color: AppColors.gray808,
              ),
            ),
            Text("\$ ${PlusAndMinus.total}", style: AppTextStyles.b1SemiBold),
          ],
        ),
      ],
    );
  }
}

// List<int> preSum = products.map(((e) => (e.price ?? 0) * e.count)).toList();
