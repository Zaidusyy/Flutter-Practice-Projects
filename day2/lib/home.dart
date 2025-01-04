import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> _servicesNameList = [
    "Consultations",
    "Medicines",
    "Laboratories"
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
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.withAlpha(40),
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(top: 20, right: 15),
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
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
            SizedBox(
              height: 20,
            ),
            Text(
              'Services',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            SizedBox(
              //     margin: EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _servicesNameList.length * 2,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
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
            SizedBox(
              height: 10,
            ),
            Text(
              'Upcoming Appointments',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                        //  height: 120,
                        // width: 300,
                        margin: EdgeInsets.all(5),
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
                                          'assets/images/Doctor${index % 2 + 1}.jpg'),
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
                                  (index % 2 == 0)
                                      ? 'Dr.Albert Flores'
                                      : 'Dr.Alina',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  (index % 2 == 0)
                                      ? 'Cardiologist'
                                      : 'Dermatologist',
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
            SizedBox(
              height: 10,
            ),
            Text(
              'Discounts',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
