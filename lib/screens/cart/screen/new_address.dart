import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/screens/cart/widgets/add_button.dart';
import 'package:ecommerce_app/screens/cart/widgets/address_checkbox.dart';
import 'package:ecommerce_app/screens/cart/widgets/my_drop_down_menu.dart';
import 'package:flutter/material.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({super.key});

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final addressController = TextEditingController();
  final dropDownController = TextEditingController();
  bool isValid = false;
  void checkValidation() {
    setState(() {
      isValid =
          addressController.text.length > 15 && selectedValueNickname != null;
      // print(dropDownController.value);
    });
  }

  void checkDropDown() {
    isValid =
        addressController.text.length > 15 && selectedValueNickname != null;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.white,

        appBar: AppBar(
          backgroundColor: AppColors.white,

          title: Text("New Address", style: AppTextStyles.h3SemiBold),

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
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                SizedBox(height: 24),

                Stack(
                  children: [
                    Image.asset(
                      "assets/images/Map.png",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: 83 + 70,
                      right: 173,
                      child: Icon(Icons.location_on, size: 64),
                    ),
                  ],
                ),
              ],
            ),

            DraggableScrollableSheet(
              initialChildSize: .80,

              minChildSize: .2,

              maxChildSize: .95,

              builder: (context, controller) {
                return Container(
                  // height: MediaQuery.of(context).size.height ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),

                      topLeft: Radius.circular(20),
                    ),

                    color: Colors.white,
                  ),

                  child: SingleChildScrollView(
                    controller: controller,

                    child: Container(
                      // height: ,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            SizedBox(height: 10),

                            Container(
                              height: 2,

                              width: 64,

                              decoration: BoxDecoration(
                                color: Color(0xffE6E6E6),

                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),

                            SizedBox(height: 14),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Address",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight(600),
                                  ),
                                ),

                                Icon(Icons.close),
                              ],
                            ),

                            SizedBox(height: 20),

                            Divider(),

                            SizedBox(height: 20),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Address Nickname",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight(500),
                                ),
                              ),
                            ),

                            MyDropDownMenu(
                              onSelected: checkDropDown,
                              myController: dropDownController,
                            ),

                            SizedBox(height: 16),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Full Address",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight(500),
                                ),
                              ),
                            ),

                            Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: addressController,
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter your full address...",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please inter full addresss";
                                  } else if (value.length < 15) {
                                    return "should be at lest 15 chracter";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  checkValidation();
                                },
                              ),
                            ),

                            SizedBox(height: 10),

                            Row(
                              children: [
                                AddressCheckbox(),
                                SizedBox(width: 8),
                                Text(
                                  "Make this as a default address",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            AddButton(
                              addButtonColor: isValid ? 0xff000000 : 0xffCCCCCC,
                              isValid3: isValid,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
