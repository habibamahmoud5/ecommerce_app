

import 'package:ecommerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class AddressInCheckout extends StatelessWidget {
  const AddressInCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.location_on),
        SizedBox(width: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Home",style: TextStyle(fontWeight: FontWeight(600)),),
            Text("925 S Chugach St #APT 10, Alaska 99645",style: TextStyle(color: AppColors.gray808),
            maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        )
      ],
    );
  }
}