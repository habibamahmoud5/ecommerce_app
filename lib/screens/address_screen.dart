import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/models/location_model.dart';
import 'package:ecommerce_app/screens/new_address.dart';
import 'package:ecommerce_app/widgets/address_in_address_screen.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  // أول Address تكون متعلمة
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,

        title: Text("Address", style: AppTextStyles.h3SemiBold),

        centerTitle: true,

        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, size: 30),
        ),

        actions: const [
          Icon(Icons.notifications_none, size: 30),
          SizedBox(width: 25),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),

        child: Stack(
          fit: StackFit.expand,

          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25),

                  Align(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Saved Address",
                      style: AppTextStyles.b1SemiBold.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  for (int i = 0; i < locations.length; i++)
                    Column(
                      children: [
                        AddressInAddressScreen(
                          location: locations[i],

                          // هل الـ Address دي مختارة؟
                          isSelected: selectedIndex == i,

                          // لما المستخدم يضغط عليها
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                        ),

                        const SizedBox(height: 12),
                      ],
                    ),

                  SizedBox(height: 12),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewAddress()),
                      );
                    },

                    child: Container(
                      height: 54,

                      decoration: BoxDecoration(
                        // color: AppColors.black,
                        border: Border.all(color: Color(0xffCCCCCC)),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Icon(Icons.add),

                          SizedBox(width: 10),

                          Text(
                            "Add New Address",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight(500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 27,
              left: 0,
              right: 0,

              child: Container(
                height: 54,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  color: AppColors.black,
                ),

                child: Center(
                  child: Text(
                    "Apply",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight(500),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> locationType = ["Home", "Office", "Apartment", "Parent’s House"];

List<LocationModel> locations = [
  LocationModel(
    type: locationType[0],
    locationDescription: "925 S Chugach St #APT 10, Alas...",
  ),
  LocationModel(
    type: locationType[1],
    locationDescription: "2438 6th Ave, Ketchikan, Alaska 99901, USA",
  ),
  LocationModel(
    type: locationType[2],
    locationDescription: "2551 Vista Dr #B301, Juneau, Alaska 99801, USA",
  ),
  LocationModel(
    type: locationType[3],
    locationDescription: "4821 Ridge Top Cir, Anchorage, Alaska 99508, USA",
  ),
];
