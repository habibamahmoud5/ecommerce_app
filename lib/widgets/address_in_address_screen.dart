import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/location_model.dart';
import 'package:ecommerce_app/screens/address_screen.dart';
import 'package:flutter/material.dart';

class AddressInAddressScreen extends StatefulWidget {
  final LocationModel location;
  const AddressInAddressScreen({super.key, required this.location});

  @override
  State<AddressInAddressScreen> createState() => _AddressInAddressScreenState();
}

class _AddressInAddressScreenState extends State<AddressInAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16, right: 28, left: 20),
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffE6E6E6), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, size: 28),
              SizedBox(width: 14),
              SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.location.type,
                      style: TextStyle(fontWeight: FontWeight(600)),
                    ),
                    Expanded(
                      child: Text(
                        widget.location.locationDescription,
                        style: TextStyle(color: AppColors.gray808),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Checkbox(
            value: isChecked[locations.indexOf(widget.location)],
            onChanged: (value) {
              setState(() {
                isChecked[locations.indexOf(widget.location)] = value!;
      
                
                // print(locations.indexOf(widget.location));
                if (value==true) {
                  isChecked = List.filled(locations.length, false);
                  isChecked[locations.indexOf(widget.location)] = true;
                }
              });
            },
            shape: CircleBorder(),
            activeColor: AppColors.black,
          ),
        ],
      ),
    );
  }
}
