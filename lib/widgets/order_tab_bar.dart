import 'package:flutter/material.dart';

class OrdersTabBar extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  const OrdersTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(6),
        ),
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
    final bool selected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
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
}