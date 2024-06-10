import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/home.dart';

class form extends StatelessWidget {


   form({super.key});

  final name=TextEditingController();
  final round=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image(
                image: AssetImage('assets/splashpng.png'),
              ),
              TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.teal,
                  ),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                  labelStyle:
                      TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.tealAccent, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.teal, width: 2)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: round,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.cached_rounded,
                    color: Colors.teal,
                  ),
                  labelText: 'Rounds',
                  hintText: 'Enter Number of Rounds',
                  labelStyle:
                      TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.tealAccent, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.teal, width: 2)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {

                  if(name.text.toString().isEmpty || round.text.toString().isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields'),backgroundColor: Colors.red,),
                    );
                    return;
                  }

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home(name: name.text.toString(), rounds: int.parse(round.text.toString()))));
                },
                child: Text(
                  'PLAY',
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Colors.tealAccent,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
