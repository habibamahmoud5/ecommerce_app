import 'package:flutter/material.dart';

import '../models/order.dart';
import '../widgets/order_card.dart';
import '../widgets/order_nav_bar.dart';
import '../widgets/order_tab_bar.dart';
import '../widgets/empty_orders.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedTab = 0;
  int _selectedNavIndex = 4;

  final List<Order> ongoingOrders = [
    Order(
      image: 'assets/images/slogan.png',
      title: 'Regular Fit Slogan',
      size: 'Size M',
      status: OrderStatus.inTransit,
      price: '1,190',
    ),
    Order(
      image: 'assets/images/polo.png',
      title: 'Regular Fit Polo',
      size: 'Size L',
      status: OrderStatus.picked,
      price: '1,100',
    ),
    Order(
      image: 'assets/images/black.png',
      title: 'Regular Fit Black',
      size: 'Size L',
      status: OrderStatus.inTransit,
      price: '1,690',
    ),
    Order(
      image: 'assets/images/Vneck.png',
      title: 'Regular Fit V-Neck',
      size: 'Size S',
      status: OrderStatus.packing,
      price: '1,290',
    ),
    Order(
      image: 'assets/images/pink.png',
      title: 'Regular Fit Pink',
      size: 'Size M',
      status: OrderStatus.picked,
      price: '1,341',
    ),
  ];

  final List<Order> completedOrders = [
    Order(
      image: 'assets/images/slogan.png',
      title: 'Regular Fit Slogan',
      size: 'Size M',
      status: OrderStatus.completed,
      price: '1,190',
    ),
    Order(
      image: 'assets/images/polo.png',
      title: 'Regular Fit Polo',
      size: 'Size L',
      status: OrderStatus.completed,
      price: '1,100',
    ),
    Order(
      image: 'assets/images/black.png',
      title: 'Regular Fit Black',
      size: 'Size L',
      status: OrderStatus.completed,
      price: '1,690',
    ),
    Order(
      image: 'assets/images/Vneck.png',
      title: 'Regular Fit V-Neck',
      size: 'Size S',
      status: OrderStatus.completed,
      price: '1,290',
    ),
    Order(
      image: 'assets/images/pink.png',
      title: 'Regular Fit Pink',
      size: 'Size M',
      status: OrderStatus.completed,
      price: '1,341',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = _selectedTab == 1;

    final orders = isCompleted
        ? completedOrders
        : ongoingOrders;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),

            OrdersTabBar(
              selectedTab: _selectedTab,
              onTabChanged: (index) {
                setState(() {
                  _selectedTab = index;
                });
              },
            ),

            Expanded(
              child: orders.isEmpty
                  ? EmptyOrders(
                      isOngoing: !isCompleted,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        16,
                        20,
                        16,
                      ),
                      itemCount: orders.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        return OrderCard(
                          order: orders[index],
                          isCompletedStyle: isCompleted,
                          buttonText: isCompleted
                              ? 'Leave Review'
                              : 'Track Order',
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: OrdersBottomNav(
        selectedIndex: _selectedNavIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 15),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () =>
                Navigator.maybePop(context),
          ),

          const Expanded(
            child: Center(
              child: Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          const Icon(
            Icons.notifications_none,
            size: 26,
          ),
        ],
      ),
    );
  }
}