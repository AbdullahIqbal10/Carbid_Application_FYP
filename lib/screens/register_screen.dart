import 'package:carbid_app/screens/login_screen.dart';
import 'package:carbid_app/screens/otp_screen.dart';
import 'package:carbid_app/screens/termsAndConditions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/green_button.dart';
import '../widgets/textfeilds.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _phone;
  late String _city;
  late String _zipCode;
  bool isChecked = false;

  void _register() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      // Registration logic
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen()));
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
                    padding:
                        const EdgeInsets.only(top: 30, left: 15, right: 15),
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
                            onSaved: (value) => _firstName = value!,
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
                            onSaved: (value) => _lastName = value!,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
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
                            onSaved: (value) => _email = value!,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            onSaved: (value) => _phone = value!,
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
                            onSaved: (value) => _city = value!,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Zip Code',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your zip code';
                                }
                                return null;
                              },
                              onSaved: (value) => _zipCode = value!),
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
                                  '  I agree with the terms and conditions',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                              width: 355,
                              height: 55,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        GlobalVariables.kPrimaryColor,
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                    )),
                                onPressed: _register,
                                child: Text('Register'),
                              )),
                          SizedBox(height: 20),
                        ]))))));
  }
}
