import 'package:carbid_app/constants.dart';
import 'package:flutter/material.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'My Ads',
            style: TextStyle(color: Colors.black, fontFamily: bold),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [offers(), offers()],
          ),
        ),
      ),
    );
  }
}

Widget offers() {
  return Container(
    margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
        color: GlobalVariables.textfeildColor,
        borderRadius: BorderRadius.circular(20)),
    child: Image(
      image: AssetImage('assets/images/download.jpg'),
      fit: BoxFit.cover,
    ),
  );
}
