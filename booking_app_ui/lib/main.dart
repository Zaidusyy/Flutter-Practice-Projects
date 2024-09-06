import 'package:booking_app_ui/Constants/car_rent_screen.dart';
import 'package:booking_app_ui/Constants/color.dart';
import 'package:booking_app_ui/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Homescreen(),
    );
  }
}
