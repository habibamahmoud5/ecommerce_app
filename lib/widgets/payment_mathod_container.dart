import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/payment_mathod_model.dart';
import 'package:flutter/material.dart';

class PaymentMathodContainer extends StatelessWidget {
  final VoidCallback onTap;
  final PaymentMathodModel paymentMathod;
  final bool isSelected;
  const PaymentMathodContainer({
    super.key,
    required this.onTap,
    required this.paymentMathod,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(10),

      child: Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          right: 28,
          left: 20,
        ),

        height: 76,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          border: Border.all(color: AppColors.lightGray, width: 1),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Image.asset("${paymentMathod.image}",width: 36,height: 14,
                fit: BoxFit.contain,),

                const SizedBox(width: 14),

                SizedBox(
                  width: 200,

                  child: Text(
                    "${paymentMathod.number}",
                  
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            Checkbox(
              value: isSelected,

              onChanged: (value) {
                onTap();
              },

              shape: const CircleBorder(),

              activeColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
