import 'package:flutter/material.dart';

import '../constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontFamily: bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Notifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildNotificationItem(
                    'Auction for 2022 Lamborghini Huracan has started',
                    'The auction for the 2022 Lamborghini Huracan has started. Don\'t miss your chance to bid!',
                  ),
                  _buildNotificationItem(
                    'Congratulations! You won the auction for the 2021 Porsche 911 Turbo',
                    'You have successfully won the auction for the 2021 Porsche 911 Turbo. Please contact us to arrange for payment and pickup.',
                  ),
                  _buildNotificationItem(
                    'New car added to the auction list',
                    'A new car, the 2022 Ferrari 488 Pista, has been added to the auction list. Check it out now!',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String title, String content) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(content),
        ],
      ),
    );
  }
}
