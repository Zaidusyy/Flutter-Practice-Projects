import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                    image: DecorationImage(
                        image: AssetImage('assets/images/Doctor2.jpg'),
                        fit: BoxFit.cover)),
              ),
              Text(
                'Dr.Maria Tereza',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Cardiologist',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 21,
                  ),
                  Text(
                    'Viva Clinic ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Mykoly Lavrukhina St. 6, Kyiv',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 75,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(40),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          '10 years \n of experience',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 75,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(40),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.deepOrange,
                                  size: 25,
                                ),
                                Text(
                                  '5.0',
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text(
                              '22 Reviews',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'About',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae lorem eros. Sed gravida dictum nulla. Fusce eget blandit lectus. Vestibulum ultricies tincidunt maximus. Quisque dictum lorem sem. Sed tristique vel metus eu varius. Nullam venenatis dolor eget erat egestas sodales. Aliquam aliquet nunc non aliquet sollicitudin. Pellentesque accumsan odio.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 4,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '22 Reviews',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                    itemBuilder: (context, index) => Container(
                          height: 170,
                          width: 350,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(40),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage('assets/images/Doctor1.jpg'),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 5,
                                      children: [
                                        Text(
                                          'Julia J.',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          '1 day ago',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                        Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pulvinar dapibus lacus, ut vehicula velit porta et. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed vestibulum nisl id nisl sollicitudin, vel viverra tortor aliquet. Donec vitae tempor velit, ut dictum augue. Aliquam mattis risus ut.',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w500),
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildRating(),
                                ],
                              )
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildRating() => SizedBox(
        child: Row(
          spacing: 5,
          children: [
            Icon(
              Icons.star,
              color: Colors.deepOrange,
              size: 25,
            ),
            Text(
              '5.0',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
