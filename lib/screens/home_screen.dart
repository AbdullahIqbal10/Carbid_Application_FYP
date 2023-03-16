import 'package:carbid_app/constants.dart';
import 'package:carbid_app/screens/notifications.dart';
import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: GlobalVariables.backgroundColor,
//         appBar: AppBar(
//             backgroundColor: GlobalVariables.backgroundColor,
//             iconTheme: IconThemeData(color: Colors.black),
//             elevation: 0,
//             actions: [
//               Container(
//                 margin: EdgeInsets.all(10),
//                 width: 300,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: TextField(
//                   onChanged: (value) => print(value),
//                   decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                       border: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       hintText: "Search product",
//                       prefixIcon: Icon(Icons.search)),
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => NotificationScreen()));
//                   },
//                   icon: Icon(Icons.notifications))
//             ]),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     chips("Sort"),
//                     chips('Filters'),
//                     chips("Price"),
//                     chips("Model"),
//                     chips("Year")
//                   ],
//                 ),
//               ),
//               Row(
//                 children: [
//                   home_tiles(),
//                   home_tiles(),
//                 ],
//               ),
//               Row(
//                 children: [
//                   home_tiles(),
//                   home_tiles(),
//                 ],
//               ),
//               Row(
//                 children: [
//                   home_tiles(),
//                   home_tiles(),
//                 ],
//               ),
//               Row(
//                 children: [
//                   home_tiles(),
//                   home_tiles(),
//                 ],
//               ),
//               Row(
//                 children: [
//                   home_tiles(),
//                   home_tiles(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget chips(String text) {
//   return Container(
//     margin: EdgeInsets.all(10),
//     height: 40,
//     width: 80,
//     decoration: BoxDecoration(
//         color: GlobalVariables.textfeildColor,
//         borderRadius: BorderRadius.circular(5)),
//     child: Center(
//         child: Text(
//       text,
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     )),
//   );
// }

// Widget home_tiles() {
//   return Container(
//       height: 200,
//       width: 185,
//       margin: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: GlobalVariables.textfeildColor,
//           borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image(image: AssetImage('assets/images/car1.webp')),
//           SizedBox(
//             height: 25,
//           ),
//           Text(
//             '   Car Name',
//             style: TextStyle(fontFamily: semibold, fontSize: 17),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 10, right: 10),
//             width: double.infinity,
//             child: Container(
//                 child: ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Bid Now'),
//                     style: ElevatedButton.styleFrom(
//                       primary: GlobalVariables.kPrimaryColor,
//                     ))),
//           )
//         ],
//       ));
// }

//DYNAMIC CODE
class Car {
  final String name;
  final String imageUrl;

  Car({required this.name, required this.imageUrl});
}

class HomeScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(name: 'Car 1', imageUrl: 'assets/images/car1.webp'),
    Car(name: 'Car 2', imageUrl: 'assets/images/car1.webp'),
    Car(name: 'Car 3', imageUrl: 'assets/images/car1.webp'),
    Car(name: 'Car 4', imageUrl: 'assets/images/car1.webp'),
    Car(name: 'Car 5', imageUrl: 'assets/images/car1.webp'),
    Car(name: 'Car 6', imageUrl: 'assets/images/car1.webp'),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
            backgroundColor: GlobalVariables.backgroundColor,
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            actions: [
              Container(
                margin: EdgeInsets.all(10),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) => print(value),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Search product",
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  },
                  icon: Icon(Icons.notifications))
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    chips("Sort"),
                    chips('Filters'),
                    chips("Price"),
                    chips("Model"),
                    chips("Year")
                  ],
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: List.generate(
                  cars.length,
                  (index) => home_tiles(cars[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget chips(String text) {
  return Container(
    margin: EdgeInsets.all(10),
    height: 40,
    width: 80,
    decoration: BoxDecoration(
        color: GlobalVariables.textfeildColor,
        borderRadius: BorderRadius.circular(5)),
    child: Center(
        child: Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    )),
  );
}

Widget home_tiles(Car car) {
  return Container(
      height: 150,
      width: 185,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: GlobalVariables.textfeildColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(car.imageUrl)),
          SizedBox(
            height: 25,
          ),
          Text('   ${car.name}',
              style: TextStyle(fontFamily: semibold, fontSize: 17)),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            child: Container(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Bid Now'),
                    style: ElevatedButton.styleFrom(
                      primary: GlobalVariables.kPrimaryColor,
                    ))),
          )
        ],
      ));
}
