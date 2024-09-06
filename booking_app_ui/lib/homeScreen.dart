import 'package:booking_app_ui/Constants/car_rent_screen.dart';
import 'package:booking_app_ui/Constants/custom_hotel_card.dart';
import 'package:booking_app_ui/Constants/custom_menu_box.dart';
import 'package:booking_app_ui/Constants/custom_search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants/color.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuList = [
      {
        'name': 'Rent Car',
        'icon': Icons.car_rental_outlined,
        'ontap': () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CarRentScreen()));
        }
      },
      {
        'name': 'Villa',
        'icon': Icons.villa_outlined,
        'ontap': () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Scaffold()));
        }
      },
      {
        'name': 'Hotel',
        'icon': Icons.hotel_outlined,
        'ontap': () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Scaffold()));
        }
      },
      {
        'name': 'Restaurant',
        'icon': Icons.restaurant_menu_outlined,
        'ontap': () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Scaffold()));
        }
      },
    ];
    final List<Map<String, String>> hotelList = [
      {
        'imageurl':
            'https://static.theprint.in/wp-content/uploads/2019/08/Taj-hotel-Mumbai-colaba.jpeg',
        'name1': 'TAJ HOTEL',
        'name2': 'The Hotel Mumbai',
        'price': '500'
      },
      {
        'imageurl':
            'https://t4.ftcdn.net/jpg/03/70/64/43/360_F_370644357_MDF4UXLAXTyyi2OyuK66tWW9cA2f8svL.jpg',
        'name1': 'DOSTI VILLA',
        'name2': 'The Dosti Villa',
        'price': '350'
      },
      {
        'imageurl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb_4eDyYEbZZIfGTq9ONANfweXjXNramlYCA&s',
        'name1': 'AROWANA',
        'name2': 'The Arowana Villa',
        'price': '200'
      },
      {
        'imageurl':
            'https://static.theprint.in/wp-content/uploads/2019/08/Taj-hotel-Mumbai-colaba.jpeg',
        'name1': 'TAJ HOTEL',
        'name2': 'The Taj Hotel',
        'price': '500'
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/D5603AQF_DfqMNKxPow/profile-displayphoto-shrink_200_200/0/1697396607338?e=2147483647&v=beta&t=8G9iMdLuA6x_9pJwB5QigG5iNNn9_laiAJCrnv-HkCA'),
                        maxRadius: MediaQuery.of(context).size.width / 20,
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 15,
                        child: CircleAvatar(
                          maxRadius: MediaQuery.of(context).size.width / 20,
                          backgroundColor: AppColors.green,
                          child: Icon(
                            size: MediaQuery.of(context).size.width / 20,
                            CupertinoIcons.plus,
                            color: AppColors.dark_grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width / 20,
                    backgroundColor: AppColors.green,
                    child: Icon(
                      size: MediaQuery.of(context).size.width / 20,
                      Icons.menu,
                      color: AppColors.dark_grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
               CustomSearchBox(hinttext: 'Where are you Going ? ',suffixicon: CupertinoIcons.search,),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 3.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuList.length,
                  itemBuilder: (context, index) {
                    return CustomMenuBox(
                      name: menuList[index]['name'],
                      icon: menuList[index]['icon'],
                      ontap: menuList[index]['ontap'],
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 1.4,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      return CustomHotelCard(
                          imageurl: hotelList[index]['imageurl'],
                          name1: hotelList[index]['name1'],
                          name2: hotelList[index]['name2'],
                          price: hotelList[index]['price']);
                    }),
              ),
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                height: MediaQuery.of(context).size.width / 2,
                width: double.infinity,
                margin: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                decoration: BoxDecoration(
                    color: AppColors.dark_grey,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Recent Ticket',
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: MediaQuery.of(context).size.width / 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.pen,
                          color: AppColors.white,
                          size: MediaQuery.of(context).size.width / 15,
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 55,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'From',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'VANCOVER',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'YVR Canada',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 50,
                            ),
                            Text(
                              'Depature',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Tue, 21 Nov',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.width / 10,
                                child: VerticalDivider(
                                    color: AppColors.grey, thickness: 2)),
                            CircleAvatar(
                              maxRadius: MediaQuery.of(context).size.width / 30,
                              backgroundColor: AppColors.green,
                              child: Icon(
                                size: MediaQuery.of(context).size.width / 30,
                                CupertinoIcons.arrow_right_arrow_left,
                                color: AppColors.dark_grey,
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.width / 10,
                                child: VerticalDivider(
                                    color: AppColors.grey, thickness: 2)),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'To',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'BARCELONE',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'BCN Spain',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 50,
                            ),
                            Text(
                              'Return',
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Mon, 4 Nov',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 25),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
