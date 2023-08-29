import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/app.dart';
import 'package:flutter_application_1/pages/developers.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    GirlsClothingPage(),
    DevelopersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Girls Clothing App'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.app_blocking),
            label: 'About App',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_mode),
            label: 'Developers',
          ),
        ],
      ),
    );
  }
}
