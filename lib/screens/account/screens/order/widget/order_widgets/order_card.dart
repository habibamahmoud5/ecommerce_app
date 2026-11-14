import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_status_badge.dart';
import 'track_order_button.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTrackOrderPressed;

  const OrderCard({super.key, required this.order, this.onTrackOrderPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.lightGray),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProductImage(image: order.image),

          10.horizontalSpace,

          Expanded(
            child: _OrderInformation(
              order: order,
              onTrackOrderPressed: onTrackOrderPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String image;

  const _ProductImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.w,
      height: 79.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}

class _OrderInformation extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTrackOrderPressed;

  const _OrderInformation({required this.order, this.onTrackOrderPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                order.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.b2SemiBold.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            5.horizontalSpace,

            OrderStatusBadge(status: order.status),
          ],
        ),

        1.verticalSpace,

        Text(
          'Size ${order.size}',
          style: AppTextStyles.b3Regular.copyWith(color: AppColors.gray808),
        ),

        12.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${order.price}',
              style: AppTextStyles.b2SemiBold.copyWith(color: AppColors.black),
            ),

            TrackOrderButton(onPressed: onTrackOrderPressed),
          ],
        ),
      ],
    );
  }
}
