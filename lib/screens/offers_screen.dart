import 'package:carbid_app/constants.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Offers"),
          backgroundColor: GlobalVariables.kPrimaryColor,
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
      image: AssetImage('assets/images/download (1).jpg'),
      fit: BoxFit.cover,
    ),
  );
}
