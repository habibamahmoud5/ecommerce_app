import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String? oldPrice;
  final String? discount;

  const ProductContainer({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.oldPrice,
    this.discount,
  });

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(widget.image, fit: BoxFit.cover),
                ),
              ),

              Positioned(
                top: 7,
                right: 7,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 16,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 5),

        Text(
          widget.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
        ),

        const SizedBox(height: 2),

        Row(
          children: [
            Text(
              '\$${widget.price}',
              style: AppTextStyles.b3Medium.copyWith(color: AppColors.gray666),
            ),

            if (widget.oldPrice != null) ...[
              const SizedBox(width: 4),
              Text(
                '\$${widget.oldPrice}',
                style: AppTextStyles.b3Regular.copyWith(
                  color: AppColors.gray999,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],

            if (widget.discount != null) ...[
              const SizedBox(width: 3),
              Text(
                widget.discount!,
                style: AppTextStyles.b3Regular.copyWith(color: AppColors.red),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
