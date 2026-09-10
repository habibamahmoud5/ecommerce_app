import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/location_model.dart';
import 'package:flutter/material.dart';

class AddressInAddressScreen extends StatelessWidget {
  final LocationModel location;

  final bool isSelected;

  final VoidCallback onTap;

  const AddressInAddressScreen({
    super.key,
    required this.location,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),

      child: Container(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          right: 28,
          left: 20,
        ),

        height: 76,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          border: Border.all(color: AppColors.lightGray, width: 1),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                const Icon(Icons.location_on, size: 28),

                const SizedBox(width: 14),

                SizedBox(
                  width: 200,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        location.type,

                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),

                      Expanded(
                        child: Text(
                          location.locationDescription,

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
              value: isSelected,

              onChanged: (value) {
                onTap();
              },

              shape: const CircleBorder(),

              activeColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
