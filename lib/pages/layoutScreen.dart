import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/AboutApp.dart';
import 'package:flutter_application_1/pages/CategoriesScreen.dart';
import 'package:flutter_application_1/pages/UserScreen.dart';
import 'package:flutter_application_1/pages/homeScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  List<Widget> screens = [
    UserProfilePage(),
    HomeContent(),
    const Category(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp),
              label: 'Account',
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Colors.pink),
          BottomNavigationBarItem(
              icon: Icon(Icons.help_center),
              label: 'About App',
              backgroundColor: Colors.pink),
        ],
      ),
    );
  }
}
