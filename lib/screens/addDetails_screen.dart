import 'package:carbid_app/constants.dart';
import 'package:carbid_app/widgets/green_button.dart';
import 'package:carbid_app/widgets/textfeilds.dart';
import 'package:flutter/material.dart';

class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Details',
          style: TextStyle(color: Colors.black, fontFamily: bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: GlobalVariables.textfeildColor),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  Text(
                    "Car details",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Textfeilds(text: "City"),
            Textfeilds(text: "Models"),
            Textfeilds(text: "Price"),
            Textfeilds(text: "Driven"),
            Textfeilds(text: "Make"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                  color: GlobalVariables.textfeildColor,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      maxLines: 8, //or null
                      decoration: InputDecoration.collapsed(
                          hintText: "Description",
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            GreenButton(text: "Post", onPressed: () {}),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
