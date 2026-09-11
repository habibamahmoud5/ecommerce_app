import 'package:flutter/material.dart';
import '../../models/order.dart';

class StatusBadge extends StatelessWidget {
  final OrderStatus status;
  final bool isCompletedStyle;

  const StatusBadge({
    super.key,
    required this.status,
    this.isCompletedStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: isCompletedStyle
            ? Colors.white
            : const Color(0xFFF1F1F1),
        border: isCompletedStyle
            ? Border.all(
                color: const Color(0xFF2E9E5B),
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isCompletedStyle
              ? const Color(0xFF2E9E5B)
              : const Color(0xFF6B6B6B),
        ),
      ),
    );
  }
}