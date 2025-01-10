import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Chats',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey.withAlpha(40),
            radius: 25,
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) => Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                padding:
                    EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(40),
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                            'assets/images/Doctor${index % 2 + 1}.jpg'),
                      ),
                      (index % 3 == 0)
                          ? Positioned(
                              top: -0.5,
                              right: 8,
                              child: Container(
                                height: 12,
                                width: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    border: Border.all(
                                        color: Colors.white, width: 1.2)),
                              ))
                          : SizedBox.shrink(),
                    ],
                  ),
                  title: Text(
                    (index % 2 == 0) ? 'Dr.Albert Flores' : 'Dr.Alina',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  subtitle: Text(
                    'hii your prescription of the recent appointment is ready',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (index < 3) ? '11:${20 + index * 3 * 2}' : '10.01.2025',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Spacer(),
                      (index < 2)
                          ? CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.deepOrange,
                              child: Center(
                                child: Text(
                                  (index == 0) ? '1' : '3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              )),
    );
  }
}
