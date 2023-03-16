import 'package:carbid_app/provider.dart';
import 'package:carbid_app/screens/otp_screen.dart';
import 'package:carbid_app/screens/terms_and_conditions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:carbid_app/constants.dart';
import 'package:carbid_app/repositories/verification_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  bool isChecked = false;

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
    final TextEditingController _city = TextEditingController();

  void _register(String emailData) async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      OtpRepository otpRepo = OtpRepository();
      context.read<EmailProvider>().updateEmail(emailData);
      print(emailData);
      int status = await otpRepo.sendOtp(emailData);
      if (status == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
      }
      else{
        Fluttertoast.showToast(msg: 'Please Try Again!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Register',
            style: TextStyle(color: Colors.black, fontFamily: bold),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Image(image: AssetImage('assets/images/logo.png')),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TermsAndConditionsScreen()));
                      },
                      child: Text(
                        'I agree with the terms and conditions',
                        style: TextStyle(
                            overflow: TextOverflow.fade, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                    width: 355,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalVariables.kPrimaryColor,
                          textStyle: TextStyle(
                            fontSize: 20,
                          )),
                      onPressed: () {
                        print(_email.value.text.toString());
                        _register(_email.value.text.toString());
                      },
                      child: Text('Register'),
                    )),
                SizedBox(height: 20),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
