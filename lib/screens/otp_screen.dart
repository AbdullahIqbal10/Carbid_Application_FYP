import 'package:carbid_app/constants.dart';
import 'package:carbid_app/widgets/green_button.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController1 = TextEditingController();
  final otpController2 = TextEditingController();
  final otpController3 = TextEditingController();
  final otpController4 = TextEditingController();

  @override
  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OTP',
          style: TextStyle(color: Colors.black, fontFamily: bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  otpField(otpController1),
                  otpField(otpController2),
                  otpField(otpController3),
                  otpField(otpController4),
                ],
              ),
              SizedBox(height: 32.0),
              GreenButton(text: 'Verify OTP', onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }

  Widget otpField(TextEditingController controller) {
    return Container(
      width: 60.0,
      height: 60.0,
      child: TextField(
        controller: controller,
        maxLength: 1,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counter: Offstage(),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
