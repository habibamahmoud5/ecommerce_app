import 'package:flutter/material.dart';


/// Status badge shown on each order card.
enum OrderStatus { inTransit, picked, packing, delivered }

extension OrderStatusLabel on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.inTransit:
        return 'In Transit';
      case OrderStatus.picked:
        return 'Picked';
      case OrderStatus.packing:
        return 'Packing';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }
}

class Order {
  final String imageUrl;
  final String title;
  final String size;
  final String price;
  final OrderStatus status;

  const Order({
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
    required this.status,
  });
}

/// SCREEN

class MyEmptyOrdersScreen extends StatefulWidget {
  /// Pass in real order data. Leave empty to see the empty state,
  /// like the "No Ongoing Orders!" screen in the design.
  final List<Order> ongoingOrders;
  final List<Order> completedOrders;

  const MyEmptyOrdersScreen({
    super.key,
    this.ongoingOrders = const [],
    this.completedOrders = const [],
  });

  @override
  State<MyEmptyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyEmptyOrdersScreen> {
  bool _showOngoing = true;

  @override
  Widget build(BuildContext context) {
    final orders = _showOngoing ? widget.ongoingOrders : widget.completedOrders;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildTabSwitcher(),
          Expanded(
            child: orders.isEmpty
                ? _EmptyState(isOngoing: _showOngoing)
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: OrderCard(order: orders[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: const Text(
        'My Orders',
        style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTabSwitcher() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: _TabButton(
                label: 'Ongoing',
                selected: _showOngoing,
                onTap: () => setState(() => _showOngoing = true),
              ),
            ),
            Expanded(
              child: _TabButton(
                label: 'Completed',
                selected: !_showOngoing,
                onTap: () => setState(() => _showOngoing = false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: selected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}

/// ----------------------------------------------------------------
/// ORDER CARD (list state)
/// ----------------------------------------------------------------

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback? onTrackOrder;

  const OrderCard({super.key, required this.order, this.onTrackOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFEFEF)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              order.imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 64,
                height: 64,
                color: const Color(0xFFF0F0F0),
                child: const Icon(Icons.image_not_supported_outlined,
                    color: Colors.grey),
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
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    _StatusBadge(status: order.status),
                  ],
                ),
                const SizedBox(height: 2),
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onTrackOrder ?? () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Track Order',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
}

class _StatusBadge extends StatelessWidget {
  final OrderStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}

/// ----------------------------------------------------------------
/// EMPTY STATE ("No Ongoing Orders!")
/// ----------------------------------------------------------------

class _EmptyState extends StatelessWidget {
  final bool isOngoing;

  const _EmptyState({required this.isOngoing});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.inventory_2_outlined,
              size: 72,
              color: Color(0xFFBDBDBD),
            ),
            const SizedBox(height: 20),
            Text(
              isOngoing ? 'No Ongoing Orders!' : 'No Completed Orders!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isOngoing
                  ? "You don't have any ongoing orders at this time."
                  : "You don't have any completed orders at this time.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// BOTTOM NAV BAR 

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _NavItem(icon: Icons.home_outlined, label: 'Home', selected: false),
            _NavItem(icon: Icons.search, label: 'Search', selected: false),
            _NavItem(icon: Icons.favorite_border, label: 'Saved', selected: false),
            _NavItem(
                icon: Icons.shopping_cart_outlined,
                label: 'Cart',
                selected: false),
            _NavItem(
                icon: Icons.person_outline, label: 'Account', selected: true),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.black : Colors.grey;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}