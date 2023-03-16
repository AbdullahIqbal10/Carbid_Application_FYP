import 'package:carbid_app/constants.dart';
import 'package:carbid_app/screens/forgot_password.dart';
import 'package:carbid_app/screens/nav_screen.dart';
import 'package:carbid_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  void _login() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      // Login logic
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Login',
            style: TextStyle(color: Colors.black, fontFamily: bold),
          ),
          elevation: 0,
        ),
        backgroundColor: GlobalVariables.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image(image: AssetImage('assets/images/logo.png')),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text(
                      "Forget password?",
                      style: TextStyle(fontSize: 20),
                    ),
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
                        onPressed: _login,
                        child: Text('Login'),
                      )),
                  SizedBox(height: 20),
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text('Register'),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
