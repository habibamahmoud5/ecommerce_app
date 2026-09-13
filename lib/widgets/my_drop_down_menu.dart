import 'package:ecommerce_app/screens/address_screen.dart';
import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  final VoidCallback onSelected;
  final dynamic myController;
  const MyDropDownMenu({super.key, required this.onSelected,required  this.myController});

  @override
  State<MyDropDownMenu> createState() => _MyDropDownMenuState();
}

String? selectedValueNickname;

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      // key: ,
      controller: widget.myController,
      width: double.infinity,
      hintText: selectedValueNickname ?? "Choose one",
      dropdownMenuEntries: [
        DropdownMenuEntry(value: locationType[0], label: locationType[0]),
        DropdownMenuEntry(value: locationType[1], label: locationType[1]),
        DropdownMenuEntry(value: locationType[2], label: locationType[2]),
        DropdownMenuEntry(value: locationType[3], label: locationType[3]),
      ],
      onSelected: (value) {
        setState(() {
          selectedValueNickname = value;
          widget.onSelected();
        });
      },
    );
  }
}
