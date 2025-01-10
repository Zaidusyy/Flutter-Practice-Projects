import 'package:day2/appointments.dart';
import 'package:day2/chat.dart';
import 'package:day2/home.dart';
import 'package:day2/profile.dart';
import 'package:day2/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Appointments(),
    Chat(),
    Results(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Material(
                color: Colors.transparent,
                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(CupertinoIcons.home),
                    ),
                    BottomNavigationBarItem(
                      label: "Appointments",
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                    BottomNavigationBarItem(
                      label: "Chats",
                      icon: Icon(CupertinoIcons.chat_bubble),
                    ),
                    BottomNavigationBarItem(
                      label: "Lab",
                      icon: Icon(CupertinoIcons.lab_flask),
                    ),
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: Icon(CupertinoIcons.person),
                    ),
                  ],
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.white,
                  iconSize: 30,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  selectedIconTheme: IconThemeData(
                    color: Colors.black,
                    size: 32,
                  ),
                  unselectedIconTheme: IconThemeData(
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
