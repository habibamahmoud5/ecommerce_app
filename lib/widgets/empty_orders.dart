import 'package:flutter/material.dart';

class EmptyOrders extends StatelessWidget {
  final bool isOngoing;

  const EmptyOrders({
    super.key,
    required this.isOngoing,
  });

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
              isOngoing
                  ? 'No Ongoing Orders!'
                  : 'No Completed Orders!',
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