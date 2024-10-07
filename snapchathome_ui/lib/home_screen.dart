import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              maxRadius: 18,
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1302487586292858880/f-YVH4H6_400x400.jpg'),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundColor: Colors.white10,
              maxRadius: 18,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Spacer(),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            maxRadius: 18,
            child: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.white10,
            maxRadius: 18,
            child: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.white30,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.black,
            height: height / 15,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          index % 2 == 0 ? 'Friends' : 'Groups',
                          style: TextStyle(color: Colors.white),
                        ),
                      ));
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 200,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 2),
                    child: ListTile(

                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        maxRadius: width/16,
                        backgroundImage: NetworkImage(
                  (index%2==0)?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJPrYWAbkAhfIUse-ZG8IJD3UhL_sR54wemQ&s':'https://static.wikia.nocookie.net/1d212a7d-16b9-4b2b-bdc3-69e3ea1c433f/scale-to-width/755'),
                      ),
                      title: Text(
                  (index%2==0)?'Saif Sid':'Maria 🫀',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: width / 30,
                            width: width / 30,
                            color: (index%2==0)?Colors.pinkAccent:Colors.purpleAccent,
                            margin: EdgeInsets.only(right: 5),
                          ),
                          Text(
                            'New Snap',
                            style: TextStyle(
                                color: (index%2==0)?Colors.pinkAccent:Colors.purpleAccent,
                                fontSize: width / 30),
                          ),
                          Text(
                            '  • 2d  ',
                            style: TextStyle(
                                color: Colors.white, fontSize: width / 30),
                          ),
                          Text(
                            '• 🔥',
                            style: TextStyle(
                                color: Colors.white, fontSize: width / 30),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
