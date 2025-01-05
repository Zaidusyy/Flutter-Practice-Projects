import 'package:day2/home.dart';
import 'package:day2/homeScreen.dart';
import 'package:day2/results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
