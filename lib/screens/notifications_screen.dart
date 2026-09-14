import 'package:ecommerce_app/screens/bottom_navigation_barr_screen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Each entry: label -> current on/off state.
  final Map<String, bool> _settings = {
    'General Notifications': true,
    'Sound': true,
    'Vibrate': false,
    'Special Offers': true,
    'Promo & Discounts': false,
    'Payments': false,
    'Cashback': true,
    'App Updates': false,
    'New Service Available': true,
    'New Tips Available': false,
  };

  int _currentNavIndex = 4;

  void _toggle(String key, bool value) {
    setState(() => _settings[key] = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const BottomNavigationBarrScreen(initialIndex: 4),
              ),
            );
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          itemCount: _settings.length,
          separatorBuilder: (_, __) => const Divider(height: 28),
          itemBuilder: (context, index) {
            final label = _settings.keys.elementAt(index);
            final value = _settings[label]!;
            return _buildToggleRow(label, value);
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildToggleRow(String label, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Switch(
          value: value,
          onChanged: (newValue) => _toggle(label, newValue),
          activeColor: Colors.white,
          activeTrackColor: Colors.black,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xFFE0E0E0),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    final items = const [
      {'icon': Icons.home_outlined, 'label': 'Home'},
      {'icon': Icons.search, 'label': 'Search'},
      {'icon': Icons.favorite_border, 'label': 'Saved'},
      {'icon': Icons.shopping_bag_outlined, 'label': 'Cart'},
      {'icon': Icons.person_outline, 'label': 'Account'},
    ];
    return BottomNavigationBar(
      currentIndex: _currentNavIndex,
      onTap: (i) => setState(() => _currentNavIndex = i),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black38,
      showUnselectedLabels: true,
      items: items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item['icon'] as IconData),
              label: item['label'] as String,
            ),
          )
          .toList(),
    );
  }
}
