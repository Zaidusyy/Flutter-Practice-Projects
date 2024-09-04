import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {

  String name;
  int rounds;

   home({super.key,required this.name,required this.rounds});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  int up=0,cp=0,round=1,com=-1,user=-1;
  bool loading=false,finish=false;

  void refresh(){
    up=0;
    cp=0;
    round=1;
    com=-1;
    user=-1;
    finish=false;
    setState(() {
    });
  }

  void play() async{
    loading=true;
    setState(() {

    });
    await Future.delayed(Duration(seconds: 1));
    loading=false;
    setState(() {

    });
    round++;
    com=Random().nextInt(3);
    if(user==com){
      return;
    }
    else if(user==0){
      if(com==1){
        cp++;
      }
      else{
        up++;
      }
    }
    else if(user==1){
      if(com==2){
        cp++;
      }
      else{
        up++;
      }
    }
    else{
      if(com==0){
        cp++;
      }
      else{
        up++;
      }
    }
    if(round-1==widget.rounds){
        finish=true;
    }
    setState(() {

    });
  }


  List<String> list=['rock.jpeg','paper.jpeg','scissors.jpeg',''];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              refresh();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.teal,
              size: 40,
            ),
            tooltip: 'Restart',
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //computer
                (loading)?Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: CircularProgressIndicator(color: Colors.teal,),
                ):Transform.rotate(
                    angle: 8,
                    child: (com==-1) ?SizedBox(height: 200,):Image(
                      image: AssetImage('assets/${list[com]}',),height: 200,
                    )),
                //user
                Transform.rotate(
                    angle: 11,
                    child: (user==-1)?SizedBox(height: 200,):Image(
                      image: AssetImage('assets/${list[user]}'),height: 200,
                    )),
              ],
            ),
            Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.tealAccent.shade200.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: (finish)?Center(child: Text((up==cp)?'MATCH TIED':(up>cp)?'${widget.name.toUpperCase()} Won by ${up-cp} points':'COMPUTER Won by ${cp-up} points',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)):Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 10,),
                  Text('Round : $round',style: TextStyle(color: Colors.teal,fontSize: 30,fontWeight: FontWeight.bold),),
                  Text('Com v/s ${widget.name}',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text('$cp-$up',style: TextStyle(color: Colors.black,fontSize: 60,fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,)
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              InkWell(
                onTap: (finish || loading)?null:(){
                  user=0;
                  play();
                },
                child: Image(
                  image: AssetImage('assets/rock.jpeg'),width: 100,
                ),
              ),
              InkWell(
                onTap: (finish || loading)?null:(){
                  user=1;
                  play();
                },
                child: Image(
                  image: AssetImage('assets/paper.jpeg'),width: 100,
                ),
              ),
              InkWell(
                onTap: (finish || loading)?null:(){
                  user=2;
                  play();
                },
                child: Image(
                  image: AssetImage('assets/scissors.jpeg'),width: 100,
                ),
              ),
            ],)
          ],
        ),
      ),
    );
  }
}
