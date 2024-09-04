import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> list = [];
  bool startflag=false;
  Timer? timer;
  int h = 0, m = 0, s = 0;
  String sh="00",sm="00",ss="00";

  void reset() {
    startflag=false;
    timer!.cancel();
    h = 0;
    m = 0;
    s = 0;
    setState(() {
      sh="00";
      sm="00";
      ss="00";
      list.clear();
    });
  }
  void addlap(){
    setState(() {
      list.add('$sh:$sm:$ss');
    });
  }
  void stop(){
    timer!.cancel();
    setState(() {
      startflag=false;
    });
  }

  void start(){
  startflag=true;
  timer=Timer.periodic(Duration(seconds: 1),(timer){
    int localsec=s+1;
    int localmin=m;
    int localhr=h;

    if (localsec > 59) {
      localsec = 0;
      localmin++;
      if (localmin > 59) {
        localmin = 0;
        localhr++;
      }
    }

    setState(() {
      s=localsec;
      m=localmin;
      h=localhr;

      ss=(s>=10)?'$s':'0$s';
      sm=(m>=10)?'$m':'0$m';
      sh=(h>=10)?'$h':'0$h';

    });
  });


  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade900,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Stopwatch',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(15),
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4), width: 2)),
              child: Center(
                child: Text(
                  '$sh:$sm:$ss',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(left: 3, right: 3),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(3),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            textAlign: TextAlign.center,
                            list[index],
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ));
                    }),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if(startflag){
                        stop();
                      }
                      else {
                        start();
                      }
                    },
                    child: Text(
                        (startflag)?'Stop':'Start',
                      style: TextStyle(
                          color: Colors.deepPurple.shade900,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
                IconButton(
                  onPressed: () {
                    addlap();
                  },
                  icon: Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      reset();
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
