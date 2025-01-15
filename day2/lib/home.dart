import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'generated/assets.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> _servicesNameList = [
    'Consultations',
    'Medicines',
    'Laboratories'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Hey, Zaid 😊',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.withAlpha(40),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              Positioned(
                top: 5,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(top: 10, right: 15, left: 15),
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent.withAlpha(40),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //    margin: EdgeInsets.only(left: 5),
                    height: 25,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Center(
                      child: Image.asset(
                        'assets/images/synevologo.png',
                        height: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Your Blood Test is ready!',
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.orange,
                    size: 22,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search for Doctors,labs,etc..',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    fillColor: Colors.grey.withAlpha(40),
                    filled: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Services',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              //     margin: EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _servicesNameList.length * 2,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                        height: 100,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(40),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/${_servicesNameList[index % 3]}.png',
                              height: 35,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              _servicesNameList[index % 3],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Upcoming Appointments',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                        //  height: 120,
                        // width: 300,
                        margin: EdgeInsets.only(top: 5, left: 15, bottom: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(40),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Assets.instance.doctors[index%2]['imageUrl']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                SizedBox(),
                                Text(
                                  Assets.instance.doctors[index%2]['name'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  Assets.instance.doctors[index%2]['specialty'],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        spacing: 5,
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          Text(
                                            (index % 2 == 0)
                                                ? '17 Aug'
                                                : '2 Sep',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        spacing: 5,
                                        children: [
                                          Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          Text(
                                            (index % 2 == 0)
                                                ? '14:40'
                                                : '11:30',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Discounts',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 10, left: 15),
                        height: 150,
                        width: 350,
                        decoration: BoxDecoration(
                            gradient: RadialGradient(
                                colors: [
                                  Colors.orange,
                                  Colors.deepOrangeAccent,
                                  Colors.deepOrange.shade400,
                                  Colors.deepOrange.shade500,
                                ],
                                center: Alignment.bottomRight,
                                radius: 1,
                                tileMode: TileMode.repeated),
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              (index % 2 == 0)
                                  ? 'Comprehensive cardiological examination'
                                  : 'Detailed dermatological assessment',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/' +
                                          ((index % 2 == 0)
                                              ? 'abbott'
                                              : 'synevologo') +
                                          '.png',
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    (index % 2 == 0) ? '-20%' : '-18%',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
