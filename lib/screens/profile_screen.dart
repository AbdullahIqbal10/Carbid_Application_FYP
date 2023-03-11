import 'package:carbid_app/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black, fontFamily: bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 115, left: 80),
                  child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.camera_alt)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            tiles("My Account", Icon(Icons.person)),
            tiles("Settings", Icon(Icons.notification_add)),
            tiles("Help Center", Icon(Icons.settings)),
            tiles("FAQ", Icon(Icons.help_center)),
            tiles("Logout", Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}

Widget tiles(String name, Icon icon) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
    decoration: BoxDecoration(
        color: Color(0xffD3D3D3), borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      leading: icon,
      title: Text(name),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  );
}
