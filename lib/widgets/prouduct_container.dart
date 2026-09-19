import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return SizedBox(
      width: 161.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 161.w,
            height: 174.h,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(widget.image, fit: BoxFit.cover),
                  ),
                ),

                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Container(
                      width: 34.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 16.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          8.verticalSpace,

          Text(
            widget.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.b1Medium.copyWith(color: AppColors.black),
          ),

          3.verticalSpace,

          Row(
            children: [
              Flexible(
                child: Text(
                  '\$${widget.price}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.b3Medium.copyWith(
                    color: AppColors.gray666,
                  ),
                ),
              ),

              if (widget.oldPrice != null) ...[
                4.horizontalSpace,

                Flexible(
                  child: Text(
                    '\$${widget.oldPrice}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.b3Regular.copyWith(
                      color: AppColors.gray999,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],

              if (widget.discount != null) ...[
                3.horizontalSpace,

                Text(
                  widget.discount!,
                  maxLines: 1,
                  style: AppTextStyles.b3Regular.copyWith(color: AppColors.red),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
