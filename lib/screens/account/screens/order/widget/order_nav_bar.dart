import 'package:flutter/material.dart';

class OrdersBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const OrdersBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'icon': Icons.home_outlined,
        'label': 'Home',
      },
      {
        'icon': Icons.search,
        'label': 'Search',
      },
      {
        'icon': Icons.favorite_border,
        'label': 'Saved',
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'label': 'Cart',
      },
      {
        'icon': Icons.person_outline,
        'label': 'Account',
      },
    ];

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) {
              final selected = index == selectedIndex;
              final color =
                  selected ? Colors.black : Colors.grey;

              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      items[index]['icon'] as IconData,
                      color: color,
                      size: 24,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      items[index]['label'] as String,
                      style: TextStyle(
                        fontSize: 11,
                        color: color,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}