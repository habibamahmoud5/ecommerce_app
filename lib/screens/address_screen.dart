import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/models/location_model.dart';
import 'package:ecommerce_app/widgets/address_in_address_screen.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Address", style: AppTextStyles.h3SemiBold),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, size: 30),
          ),
          actions: const [
            Icon(Icons.notifications, size: 30),
            SizedBox(width: 25),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Saved Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight(600)),
                  ),
                ),
                SizedBox(height: 14),
                // AddressInAddressScreen(location: locations[0]),
                // SizedBox(height: 12,),
                // AddressInAddressScreen(location: locations[1]),
                // SizedBox(height: 12,),
                // AddressInAddressScreen(location: locations[2]),
                // SizedBox(height: 12,),
                // AddressInAddressScreen(location: locations[3]),
                // SizedBox(height: 24,)
                for(int i =0;i<locations.length;i++)
                Column(
                  children: [
                    AddressInAddressScreen(location: locations[i]),
                    SizedBox(height: 12,)
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: Color()
                    )
                  ),
                )
              ],
            ),
          ),
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
List<bool> isChecked = [true, ...List.filled(locations.length-1, false)];
//  isChecked[0] = true;

