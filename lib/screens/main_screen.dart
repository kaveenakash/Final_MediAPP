

import 'package:flutter/material.dart';
import 'package:medicine_remainder_app/constants.dart';
import 'package:medicine_remainder_app/screens/HealthInformation/healthinformation_screen.dart';
import 'package:medicine_remainder_app/screens/Home/home_screen.dart';
import 'package:medicine_remainder_app/screens/Profiles/profiles_screen.dart';
import 'package:medicine_remainder_app/screens/Reminder/reminder_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/main';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [
    HomeScreen(),
    ReminderScreen(),
    HealthInformationScreen(),
    ProfilesScreen(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor:kPrimaryColor,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Home Page", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: "Bar Item Page", icon: Icon(Icons.alarm)),
          BottomNavigationBarItem(
              label: "Search Page", icon: Icon(Icons.description_outlined)),
          BottomNavigationBarItem(label: "My Page", icon: Icon(Icons.family_restroom_rounded)),
        ],
      ),
    );
  }
}
