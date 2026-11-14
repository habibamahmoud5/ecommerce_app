import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusSheet extends StatelessWidget {
  final DraggableScrollableController sheetController;
  final double minSize;
  final double initialSize;
  final double maxSize;

  const OrderStatusSheet({
    super.key,
    required this.sheetController,
    required this.minSize,
    required this.initialSize,
    required this.maxSize,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: initialSize,
      minChildSize: minSize,
      maxChildSize: maxSize,
      snap: true,
      snapSizes: [minSize, initialSize, maxSize],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDragHandle(),

                5.verticalSpace,

                _buildHeader(),

                5.verticalSpace,

                const Divider(),

                5.verticalSpace,

                const StatusStep(
                  title: 'Packing',
                  subtitle: '2336 Jack Warren Rd, Delta Junction, Alaska 9...',
                  filled: true,
                  showLine: true,
                ),

                const StatusStep(
                  title: 'Picked',
                  subtitle: '2417 Tongass Ave #111, Ketchikan, Alaska 99901...',
                  filled: true,
                  showLine: true,
                ),

                const StatusStep(
                  title: 'In Transit',
                  subtitle: '16 Rr 2, Ketchikan, Alaska 99901, USA',
                  filled: true,
                  showLine: true,
                ),

                const StatusStep(
                  title: 'Delivered',
                  subtitle: '925 S Chugach St #APT 10, Alaska 99645',
                  filled: false,
                  showLine: false,
                ),

                10.verticalSpace,

                const Divider(),

                10.verticalSpace,

                const DeliveryGuy(),

                10.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDragHandle() {
    return Center(
      child: Container(
        width: 64.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order Status',
          style: AppTextStyles.h4SemiBold.copyWith(color: AppColors.black),
        ),

        IconButton(
          onPressed: () {
            sheetController.animateTo(
              minSize,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          icon: Icon(Icons.close, size: 24.sp, color: AppColors.black),
        ),
      ],
    );
  }
}

class StatusStep extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool filled;
  final bool showLine;

  const StatusStep({
    super.key,
    required this.title,
    required this.subtitle,
    required this.filled,
    required this.showLine,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                Icons.radio_button_checked_outlined,
                size: 20.sp,
                color: filled ? AppColors.black : AppColors.grayCC,
              ),

              if (showLine)
                Expanded(
                  child: Container(width: 2.w, color: AppColors.grayCC),
                ),
            ],
          ),

          8.horizontalSpace,

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.b1SemiBold.copyWith(
                      color: AppColors.black,
                    ),
                  ),

                  2.verticalSpace,

                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.b2Regular.copyWith(
                      color: AppColors.gray808,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryGuy extends StatelessWidget {
  const DeliveryGuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26.r,
          backgroundImage: const AssetImage('assets/images/person.png'),
        ),

        5.horizontalSpace,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jacob Jones',
                style: AppTextStyles.b1SemiBold.copyWith(
                  color: AppColors.black,
                ),
              ),

              2.verticalSpace,

              Text(
                'Delivery Guy',
                style: AppTextStyles.b2Regular.copyWith(
                  color: AppColors.gray808,
                ),
              ),
            ],
          ),
        ),

        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(Icons.call, size: 24.sp, color: AppColors.black),
        ),
      ],
    );
  }
}
