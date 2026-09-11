
import 'package:ecommerce_app/screens/Myorders_ongoing_completed_screen.dart';
import 'package:ecommerce_app/screens/onboarding_screen.dart';
import 'package:ecommerce_app/screens/track_order_screen.dart';
import 'package:flutter/material.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyOrdersScreen(),
    );
  }
}
