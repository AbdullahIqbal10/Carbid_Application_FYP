import 'package:carbid_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/green_button.dart';
import '../widgets/textfeilds.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
          backgroundColor: GlobalVariables.kPrimaryColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/logo.png')),
              Textfeilds(text: "Enter new password"),
              Textfeilds(text: "Confirm Password"),
              SizedBox(
                height: 20,
              ),
              GreenButton(
                  text: "Update",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  })
            ],
          ),
        ),
      ),
    );
    ;
  }
}
