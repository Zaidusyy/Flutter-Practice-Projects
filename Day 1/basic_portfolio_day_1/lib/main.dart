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
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'My Portfolio',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjH3asamCIge-3u65qhVVMg5OpC-_xrSV_9LDQcn8Mc5ZGKVmDDDZwNl9Gx2mpSj_oKmx9vZMyxVMe0dTTT1TIpAylkUsJ_p0feDwHuOipsnZx-lSPqqShmhVKiaTSRe4GSKMwijOwyJtVyndpb8LQnITkzbtoNmSUqSzOAvXf6OmG3yRw/s220/profile.jpeg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Zaid Sayyed',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Eduction',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                'United University',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'Bachelor of Computer Application (2022-2025)',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Burhani College ',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'Intermediate in Commerce Maharashtra HSC (2020-2022)',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'St. Agrasen High School',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'High School Maharashtra SSC (2019-2020)',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
