import 'package:carbid_app/constants.dart';
import 'package:flutter/material.dart';

class Textfeilds extends StatefulWidget {
  final String text;

  const Textfeilds({
    super.key,
    required this.text,
  });

  @override
  State<Textfeilds> createState() => _TextfeildsState();
}

class _TextfeildsState extends State<Textfeilds> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: TextFormField(
          decoration: InputDecoration(
            filled: true, //<-- SEE HERE
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: GlobalVariables.backgroundColor,
            hintText: widget.text,
            hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            // border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
