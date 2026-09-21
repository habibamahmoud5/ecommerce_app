import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int card2 = 0xff1A1A1A; /////black
  int card1 = 0xffFFFFFF; /////white

  int cash2 = 0xff1A1A1A; /////black
  int cash1 = 0xffFFFFFF; /////white

  int pay2 = 0xff1A1A1A; /////black
  int pay1 = 0xffFFFFFF; /////white

  int black = 0xff1A1A1A;
  int white = 0xffFFFFFF;

  void swapping(int ele1, int ele2) {
    int help = ele1;
    ele1 = ele2;
    ele2 = help;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                if (card2 == black && card1 == white) {
                  card1 = black;
                  card2 = white;
                  cash1 = white;
                  cash2 = black;
                  pay1 = white;
                  pay2 = black;
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 5),
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: Color(0xffE6E6E6)),
                borderRadius: BorderRadius.circular(10),
                color: Color(
                  card1,
                ), ///////////////////////////////////////////   background = 1
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.credit_card, color: Color(card2)),
                  Text(
                    "Card",
                    style: TextStyle(
                      fontWeight: FontWeight(500),
                      color: Color(card2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                if (cash2 == black && cash1 == white) {
                  card1 = white;
                  card2 = black;
                  cash1 = black;
                  cash2 = white;
                  pay1 = white;
                  pay2 = black;
                }
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: Color(0xffE6E6E6)),
                borderRadius: BorderRadius.circular(10),
                color: Color(cash1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.payments, color: Color(cash2)),
                  Text(
                    "Cash",
                    style: TextStyle(
                      fontWeight: FontWeight(500),
                      color: Color(cash2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                if (pay2 == black && pay1 == white) {
                  card1 = white;
                  card2 = black;
                  cash1 = white;
                  cash2 = black;
                  pay1 = black;
                  pay2 = white;
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 5),
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: Color(0xffE6E6E6)),
                borderRadius: BorderRadius.circular(10),
                color: Color(pay1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.credit_card, color: Color(pay2)),
                  Text(
                    "pay",
                    style: TextStyle(
                      fontWeight: FontWeight(500),
                      color: Color(pay2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
