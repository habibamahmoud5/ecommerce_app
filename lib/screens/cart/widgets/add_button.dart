import 'package:ecommerce_app/screens/cart/widgets/congratulations_box.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final int addButtonColor;
  bool isValid3;
  AddButton({super.key, required this.addButtonColor, required this.isValid3});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  // int addButtonColor = 0xffCCCCCC;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isValid3) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return CongratulationsBox(
                event: "Your new address has been added.",
                buttonText: "Thanks",
              );
            },
          );
        }
      },

      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(widget.addButtonColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Add",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight(600),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
