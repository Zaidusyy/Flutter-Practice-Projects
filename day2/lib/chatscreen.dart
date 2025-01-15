import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'generated/assets.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(Assets.imagesDoctor2),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Assets.instance.doctors[2]['name'],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              Text(
                '⦿ Online',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          actions: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Icon(
                CupertinoIcons.video_camera,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
                size: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                        itemBuilder: (context, index) => (index % 2 == 0)
                            ? Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '   ' + Assets.instance.doctors[2]['name'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Container(
                                      alignment: AlignmentDirectional.topStart,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          top: 5, bottom: 10, right: 80),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withAlpha(40),
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12),
                                            textAlign: TextAlign.left,
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional.bottomEnd,
                                            child: Text(
                                              '10:32',
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 12),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'You     ',
                                      style:
                                          TextStyle(color: Colors.grey, fontSize: 13),
                                    ),
                                    Container(
                                      alignment: AlignmentDirectional.topEnd,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(bottom: 10, left: 80),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.withAlpha(150),
                                              width: 1),
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Column(
                                        children: [
                                          Text(
                                            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 12),
                                            textAlign: TextAlign.start,
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional.bottomEnd,
                                            child: Text(
                                              '10:32',
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 12),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildmessageinput(),
            )
          ],
        ));
  }

  _buildmessageinput() => Container(
    height: 70,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        child: Row(
          spacing: 5,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.withAlpha(50),
              child: Icon(
                CupertinoIcons.add,
                color: Colors.black,
                size: 30,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.withAlpha(40),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove border
                          hintText: 'Type message...',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
