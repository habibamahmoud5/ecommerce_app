import 'package:flutter/material.dart';

class CongratulationsBox extends StatelessWidget {
  final String event;
  final String buttonText;
  const CongratulationsBox({super.key,required this .event,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 64,
              width: 64,
              child: Stack(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Color.fromARGB(255, 136, 244, 134),
                    ),
                  ),
                  Image.asset(
                    "assets/correct.png",
                    width: 64,
                    height: 64,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Congratulations!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 10),

            Text(
              event,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(buttonText, style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
