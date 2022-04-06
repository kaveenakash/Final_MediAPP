// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/components/category_card.dart';
import 'package:medicine_remainder_app/models/Product.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/services/notification_services.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product('Surgical Mask', "It is designed to prevent infections.",
        'assets/images/mask.png', 160),
    Product(
        'Black n95 Mask',
        "It is n95 mask designed to prevent infections in patients.",
        'assets/images/black_mask.png',
        250),
    Product('Eye Patch', "It is designed to prevent infections in eyes.",
        'assets/images/eyepatch.png', 300),
  ];

  var notifyHelper;
  @override
  void initState(){
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.requestIOSPermissions();
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Hi! Akash',
              style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            SizedBox(height: 25),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor),
                  ),
                  onPressed: () {
                    notifyHelper.displayNotification(title:"dadasd",body:"dadas");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Upload Your Reports',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 125,
              child: ListView(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    title: 'Reminders',
                    icon: Icons.alarm,
                  ),
                  CategoryCard(
                    title: 'Reports',
                    icon: Icons.description_outlined,
                  ),
                  CategoryCard(
                      title: 'Family', icon: Icons.family_restroom_rounded),
                ],
              ),
            ),
            SizedBox(height: 25),
            Text(
              "Medicine Reminders",
              style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 15),
            // Expanded(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: products.length,
            //     itemBuilder: (context, index) =>
            //         ProductCard(product: products[index]),
            //   ),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kSecondary,
      //   splashColor: kPrimary,
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => Reminder(),
      //       ),
      //     );
      //   },
      //   child: Icon(
      //     Icons.alarm_add,
      //     color: kTextPrimary,
      //     size: 30,
      //   ),
      // ),
    );
  }
}
