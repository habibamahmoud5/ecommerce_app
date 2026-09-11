import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyOrdersScreen(),
    );
  }
}

class Order {
  final String image;
  final String title;
  final String size;
  final String status;
  final String price;

  Order({
    required this.image,
    required this.title,
    required this.size,
    required this.status,
    required this.price,
  });
}

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedTab = 0; // 0 = Ongoing, 1 = Completed
  int _selectedNavIndex = 4; // Account tab selected by default

  final List<Order> ongoingOrders = [
    Order(
      image: 'assets/images/slogan.png',
      title: 'Regular Fit Slogan',
      size: 'Size M',
      status: 'In Transit',
      price: '1,190',
    ),
    Order(
      image: 'assets/images/polo.png',
      title: 'Regular Fit Polo',
      size: 'Size L',
      status: 'Picked',
      price: '1,100',
    ),
    Order(
      image: 'assets/images/black.png',
      title: 'Regular Fit Black',
      size: 'Size L',
      status: 'In Transit',
      price: '1,690',
    ),
    Order(
      image: 'assets/images/Vneck.png',
      title: 'Regular Fit V-Neck',
      size: 'Size S',
      status: 'Packing',
      price: '1,290',
    ),
    Order(
      image: 'assets/images/pink.png',
      title: 'Regular Fit Pink',
      size: 'Size M',
      status: 'Picked',
      price: '1,341',
    ),
  ];

  final List<Order> completedOrders = [
    Order(
      image: 'assets/images/slogan.png',
      title: 'Regular Fit Slogan',
      size: 'Size M',
      status: 'Completed',
      price: '1,190',
    ),
    Order(
      image: 'assets/images/polo.png',
      title: 'Regular Fit Polo',
      size: 'Size L',
      status: 'Completed',
      price: '1,100',
    ),
    Order(
      image: 'assets/images/black.png',
      title: 'Regular Fit Black',
      size: 'Size L',
      status: 'Completed',
      price: '1,690',
    ),
    Order(
      image: 'assets/images/Vneck.png',
      title: 'Regular Fit V-Neck',
      size: 'Size S',
      status: 'Completed',
      price: '1,290',
    ),
    Order(
      image: 'assets/images/pink.png',
      title: 'Regular Fit Pink',
      size: 'Size M',
      status: 'Completed',
      price: '1,341',
    ),
  ];

  // Ongoing tab badge style
  final Color _statusBgColor = const Color(0xFFF1F1F1);
  final Color _statusTextColor = const Color(0xFF6B6B6B);

  // Completed tab badge style 
  final Color _completedBorderColor = const Color(0xFF2E9E5B);
  final Color _completedTextColor = const Color(0xFF2E9E5B);

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = _selectedTab == 1;
    final orders = isCompleted ? completedOrders : ongoingOrders;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildTabBar(),
            Expanded(
              child: orders.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      itemCount: orders.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemBuilder: (context, index) => _buildOrderCard(
                        orders[index],
                        isCompleted,
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  //App Bar
  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 15),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.maybePop(context),
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
          const Icon(Icons.notifications_none, size: 26),
        ],
      ),
    );
  }

  // Tab Bar 
  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            _buildTabItem('Ongoing', 0),
            _buildTabItem('Completed', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String label, int index) {
    final bool selected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  // Order Card
  Widget _buildOrderCard(Order order, bool isCompleted) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 64,
              height: 64,
              color: const Color(0xFFF3F3F3),
              child: Image.asset(
                order.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.checkroom,
                  color: Colors.grey,
                  size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        order.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // Completed tab: green outline + green text.
                    // Ongoing tab: unchanged grey pill.
                    isCompleted
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: _completedBorderColor, width: 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              order.status,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: _completedTextColor,
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: _statusBgColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              order.status,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: _statusTextColor,
                              ),
                            ),
                          ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  order.size,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      // Completed tab: "Leave Review". Ongoing tab: "Track Order".
                      child: Text(
                        isCompleted ? 'Leave Review' : 'Track Order',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Empty State
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inventory_2_outlined,
                size: 56, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'No Ongoing Orders!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "You don't have any ongoing orders at this time.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Navigation
  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_outlined, 'label': 'Home'},
      {'icon': Icons.search, 'label': 'Search'},
      {'icon': Icons.favorite_border, 'label': 'Saved'},
      {'icon': Icons.shopping_cart_outlined, 'label': 'Cart'},
      {'icon': Icons.person_outline, 'label': 'Account'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final selected = index == _selectedNavIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedNavIndex = index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  items[index]['icon'] as IconData,
                  color: selected ? Colors.black : Colors.grey,
                  size: 24,
                ),
                const SizedBox(height: 2),
                Text(
                  items[index]['label'] as String,
                  style: TextStyle(
                    fontSize: 11,
                    color: selected ? Colors.black : Colors.grey,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}