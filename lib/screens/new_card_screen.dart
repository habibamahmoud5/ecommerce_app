import 'package:ecommerce_app/core/app_text_style.dart';
import 'package:ecommerce_app/core/colors.dart';
import 'package:ecommerce_app/widgets/congratulations_box.dart';
import 'package:flutter/material.dart';

class NewCardScreen extends StatefulWidget {
  const NewCardScreen({super.key});

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final securityCodeController = TextEditingController();
  bool isValid2 = false;
  void checkValidation2() {
    setState(() {
      isValid2 =
          (_formKey.currentState?.validate() ?? false) &&
          (_formKey1.currentState?.validate() ?? false) &&
          (_formKey2.currentState?.validate() ?? false);
      // &&
      // cardNumberController.text.length == 16 &&
      // expiryDateController.text.isNotEmpty &&
      // securityCodeController.text.length == 6 &&
      // RegExp(r'^[0-9]+$').hasMatch(securityCodeController.text);
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  // final isValid =
  //     _formKey.currentState?.validate() ?? false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,

          title: Text("New Card", style: AppTextStyles.h3SemiBold),

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
            children: [
              Column(
                children: [
                  SizedBox(height: 24),
                  Divider(),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add Debit or Credit Card",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Card number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight(500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 52,
                    child: Form(
                      child: TextFormField(
                        key: _formKey,
                        onChanged: (value) {
                          checkValidation2();
                        },
                        controller: cardNumberController,
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your card number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffE6E6E6)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Cridit card';
                          } else if (value.length != 16 ||
                              RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'card number should be 16 number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: 5.5),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Expiry Date",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight(500),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 52,
                                child: Form(
                                  child: TextFormField(
                                    key: _formKey1,
                                    onChanged: (value) {
                                      checkValidation2();
                                    },
                                    controller: expiryDateController,
                                    onTapOutside: (event) {
                                      FocusScope.of(context).unfocus();
                                    },
                                    decoration: InputDecoration(
                                      hintText: "MM/YY",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Color(0xffE6E6E6),
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Expiry Date';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 5.5),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Security Code",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight(500),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 52,
                                child: Form(
                                  child: TextFormField(
                                    key: _formKey2,
                                    onChanged: (value) {
                                      checkValidation2();
                                    },
                                    controller: securityCodeController,
                                    onTapOutside: (event) {
                                      FocusScope.of(context).unfocus();
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.help,
                                        color: Color(0xff999999),
                                      ),
                                      hintText: "CVC",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Color(0xffE6E6E6),
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter security code';
                                      } else if (value.length != 6 ||
                                          RegExp(r'^[0-9]+$').hasMatch(value)) {
                                        return 'card number should be 6 number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 27,
                left: 0,
                right: 0,

                child: InkWell(
                  onTap: () {
                    if (isValid2) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return CongratulationsBox(
                            event: "Your new card has been added.",
                            buttonText: "Thanks",
                          );
                        },
                      );
                    }
                    // print(_formKey.currentState!.validate() &&
                    //     _formKey1.currentState!.validate() &&
                    //     _formKey2.currentState!.validate() );
                  },
                  child: Container(
                    height: 54,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      color: isValid2 ? AppColors.black : Color(0xffCCCCCC),
                    ),

                    child: Center(
                      child: Text(
                        "Add Card",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight(500),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
