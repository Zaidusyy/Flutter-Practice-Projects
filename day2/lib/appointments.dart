import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  int currindex = 1;

  void _changedate(int index) {
    setState(() {
      currindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
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
                size: 25,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 180),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: 22,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Center(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          height: 120,
                          width: 80,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (index == currindex)
                                ? Colors.deepOrange
                                : Colors.transparent,
                            border: (index == currindex)
                                ? null
                                : Border.all(
                                    color: Colors.grey.withAlpha(60), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Jan',
                                style: TextStyle(
                                  color: (index == currindex)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${index + 10}',
                                style: TextStyle(
                                  color: (index == currindex)
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          _changedate(index);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.grey.withAlpha(60), width: 2)),
                  child: TabBar(
                    splashFactory: NoSplash.splashFactory,
                    indicator: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: '   Upcoming   '),
                      Tab(text: '   Completed   '),
                      Tab(text: '   Cancelled   '),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildAppointmentList(),
            _buildAppointmentList(),
            _buildAppointmentList(),
          ],
        ),
      ),
    );
  }
  _buildAppointmentList()=>ListView.builder(
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        width: double.infinity,
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  (index%2==0)?'14:20':'16:30',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  '30 min',
                  style:
                  TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            Expanded(
              child: Container(

                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(40),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/Doctor${index % 2 + 1}.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          )),
                      title: Text(
                        (index % 2 == 0)
                            ? 'Dr.Albert Flores'
                            : 'Dr.Alina',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      subtitle: Text(
                        (index % 2 == 0)
                            ? 'Cardiologist'
                            : 'Dermatologist',
                        style: TextStyle(
                            color: Colors.grey, fontSize: 15),
                      ),
                      trailing: Icon(
                        CupertinoIcons.ellipsis_vertical,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                        size: 25,
                      ),
                      title: Text(
                        (index % 2 == 0)
                            ? 'Viva Clinic'
                            : 'Dobrobut',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      subtitle: Text(
                        (index % 2 == 0)
                            ? 'Mykoly Lavrukhina St. 6, Kyiv'
                            : 'Tatarska St. 2e, Kyiv',
                        style: TextStyle(
                            color: Colors.deepOrange, fontSize: 12),
                      ),
                      trailing: Icon(
                        CupertinoIcons.right_chevron,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
