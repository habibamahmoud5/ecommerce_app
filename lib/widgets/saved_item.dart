import 'package:ecommerce_app/models/clothes_model.dart';
import 'package:flutter/material.dart';

class SavedItem extends StatelessWidget {
  final ClothesModel product;
  const SavedItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      height: 172,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Image.asset(
            "${product.image}",
            width: 161,
            height: 172,
            fit: BoxFit.contain,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              height: 50,
              width: 161,
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${product.name}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\$ ${product.price}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight(500),
                        color: Color(0xff808080),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(child: Icon(Icons.favorite, color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
