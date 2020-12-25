import 'package:flutter/material.dart';
import 'package:matanamart/pages/discover.dart';
import 'package:matanamart/pages/near-by.dart';

/// Class for custom bottom navigation bar
class CustomBtnNavBar {
  const CustomBtnNavBar(this.title, this.icon);
  final String title;
  final Icon icon;
}

const List<CustomBtnNavBar> AllCustomBtnNavBar = <CustomBtnNavBar>[
  CustomBtnNavBar(
    'Home',
    Icon(Icons.home),
  ),
  CustomBtnNavBar(
    'Near by',
    Icon(Icons.map),
  ),
];

class Home extends StatefulWidget {
  final String id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> mainPage = [
    Discover(),
    NearBy(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPage[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey.shade100,
          primaryColor: Colors.yellow,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey[300],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: AllCustomBtnNavBar.map((CustomBtnNavBar customBtnNavBar) {
            return BottomNavigationBarItem(
                title: Text(customBtnNavBar.title), icon: customBtnNavBar.icon);
          }).toList(),
        ),
      ),
    );
  }
}
