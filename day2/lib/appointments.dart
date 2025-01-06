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
          SizedBox(
            width: 10,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 120),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    height: 120,
                    width: 80,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: (index == 1)
                          ? Colors.orange
                          : Colors.grey.withAlpha(40),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Day ${index + 1}',
                        style: TextStyle(
                          color: (index == 1) ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
            )),
      ),
    );
  }
}
