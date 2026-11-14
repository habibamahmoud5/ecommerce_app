import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/order_model.dart';
import 'package:ecommerce_app/screens/account/screens/order/screen/track_order_screen.dart';
import 'package:ecommerce_app/screens/account/screens/order/widget/order_widgets/order_card.dart';
import 'package:ecommerce_app/screens/account/screens/order/widget/order_widgets/orders_tabs.dart';
import 'package:ecommerce_app/widgets/app_bar_textt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<OrderModel> ongoingOrders = [
  OrderModel(
    name: 'Regular Fit Slogan',
    size: 'M',
    price: '1,190',
    image: 'assets/images/product 1.png',
    status: 'In Transit',
  ),

  OrderModel(
    name: 'Regular Fit Polo',
    size: 'L',
    price: '1,100',
    image: 'assets/images/product2.png',
    status: 'Picked',
  ),

  OrderModel(
    name: 'Regular Fit Black',
    size: 'L',
    price: '1,690',
    image: 'assets/images/product3.png',
    status: 'In Transit',
  ),

  OrderModel(
    name: 'Regular Fit V-Neck',
    size: 'S',
    price: '1,290',
    image: 'assets/images/product4.png',
    status: 'Packing',
  ),

  OrderModel(
    name: 'Regular Fit Pink',
    size: 'M',
    price: '1,341',
    image: 'assets/images/product2.png',
    status: 'Picked',
  ),
];

class OngoingOrdersScreen extends StatefulWidget {
  const OngoingOrdersScreen({super.key});

  @override
  State<OngoingOrdersScreen> createState() => _OngoingOrdersScreenState();
}

class _OngoingOrdersScreenState extends State<OngoingOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Column(
            children: [
              15.verticalSpace,

              AppBarText(
                title: 'My Orders',
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: AppColors.black,
                  ),
                ),
                action: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 24,
                    color: AppColors.black,
                  ),
                ),
              ),

              10.verticalSpace,
              const OrdersTabs(),
              20.verticalSpace,
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  itemCount: ongoingOrders.length,
                  itemBuilder: (context, index) {
                    final order = ongoingOrders[index];

                    return OrderCard(
                      order: order,
                      onTrackOrderPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TrackOrderScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
