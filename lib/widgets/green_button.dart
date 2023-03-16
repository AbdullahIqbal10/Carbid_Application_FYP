import 'package:carbid_app/constants.dart';
import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const GreenButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 355,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: GlobalVariables.kPrimaryColor,
              textStyle: TextStyle(
                fontSize: 20,
              )),
          onPressed: onPressed,
          child: Text(text),
        ));
  }
}
