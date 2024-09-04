import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/form.dart';
import 'package:rock_paper_scissors_game/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>form()));
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage('assets/splashpng.png'),),
            Text('Rock Paper Scissor Game',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(width: 80,height: 80,child: CircularProgressIndicator(color: Colors.white,strokeWidth: 8,))
          ],
        ),
      ),
    );
  }


}
