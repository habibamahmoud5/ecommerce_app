import 'package:ecommerce_app/screens/saved/widget/saved_product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedItemProduct extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const SavedItemProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,

      physics: const NeverScrollableScrollPhysics(),

      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),

      itemCount: products.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: 1.001,
      ),

      itemBuilder: (context, index) {
        final product = products[index];

        return SavedProductContainer(
          image: product['image'],
          name: product['name'],
          price: product['price'],
        );
      },
    );
  }
}
