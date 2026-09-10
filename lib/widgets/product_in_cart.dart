import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/clothes_model.dart';
import 'package:ecommerce_app/widgets/plus_and_minus.dart';
import 'package:flutter/material.dart';

class ProductInCart extends StatelessWidget {
  final ClothesModel product;
  const ProductInCart({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 14
      ),
      height: 107,
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: AppColors.lightGray),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("${product.image}", width: 83, height: 79, fit: BoxFit.contain),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${product.name}",
                          style: TextStyle(fontWeight: FontWeight(600)),
                          maxLines: 1,overflow: TextOverflow.ellipsis,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${product.size}",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.gray808,
                            ),
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Text("\$  ${product.price}", style: TextStyle(fontWeight: FontWeight(600))),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.delete, color: Color(0xffED1010)),
                PlusAndMinus(clothesModel: product)
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
