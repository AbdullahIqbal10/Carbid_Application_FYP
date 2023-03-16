import 'package:carbid_app/constants.dart';
import 'package:carbid_app/provider.dart';
import 'package:carbid_app/repositories/verification_repository.dart';
import 'package:carbid_app/screens/home_screen.dart';
import 'package:carbid_app/widgets/green_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  late String _otp;
  
  late String email;

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
                  OtpInput(_fieldOne, true), // auto focus
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false)
                ],
              ),
              SizedBox(height: 32.0),
              GreenButton(
                  text: 'Verify OTP',
                  onPressed: () async {
                    setState(() {
                      _otp = _fieldOne.text.toString() +
                          _fieldTwo.text.toString() +
                          _fieldThree.text.toString() +
                          _fieldFour.text.toString();
                    });
                    OtpRepository otpRepo = OtpRepository();
                    int status = await otpRepo.verifyOtp(_otp,context.read<EmailProvider>().email);
                    if (status == 200) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    } else {
                      Fluttertoast.showToast(msg: 'Incorrect OTP!');
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              // Text(
                // _otp ?? 'Please enter OTP',
                // style: const TextStyle(fontSize: 30),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.17,
      height: MediaQuery.of(context).size.width * 0.2,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
