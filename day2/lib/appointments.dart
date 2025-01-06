import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Appointments',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.withAlpha(40),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
