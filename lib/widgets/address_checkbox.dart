import 'package:flutter/material.dart';

class AddressCheckbox extends StatefulWidget {
  
  // final VoidCallback onChanged;
  const AddressCheckbox({super.key, });

  @override
  State<AddressCheckbox> createState() => _AddressCheckboxState();
}

class _AddressCheckboxState extends State<AddressCheckbox> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      value: checkboxValue,
      onChanged: (change) {
        setState(() {
          checkboxValue = change!;
          // widget.onChanged();
        });
      },
    );
  }
}
