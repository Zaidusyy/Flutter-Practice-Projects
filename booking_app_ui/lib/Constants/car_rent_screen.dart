import 'package:booking_app_ui/Constants/car_booking_list_card.dart';
import 'package:booking_app_ui/Constants/custom_search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class CarRentScreen extends StatelessWidget {
  const CarRentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String,String>> carList=[
      {'name': 'Tesla Model 5','type': 'Automatic', 'price': '269/day','image': 'img1.png'},
      {'name': 'Hyundai','type': 'Automatic', 'price': '129/day','image': 'img2.png'},
      {'name': 'BMW','type': 'Manual', 'price': '329/day','image': 'img3.png'},
      {'name': 'Mercedes','type': 'Automatic', 'price': '149/day','image': 'img4.png'},
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.white,
                    size: MediaQuery.of(context).size.width / 18,
                  ),
                  Text(
                    ' BARCELONA, SPAIN',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: MediaQuery.of(context).size.width / 20),
                  ),
                  Spacer(),
                  CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.width / 20,
                    backgroundColor: AppColors.green,
                    child: Icon(
                      size: MediaQuery.of(context).size.width / 20,
                      Icons.filter_list_outlined,
                      color: AppColors.dark_grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomSearchBox(
                hinttext: 'Search a Car',
                suffixicon: CupertinoIcons.search,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
                indicatorColor: Colors.transparent,
                isScrollable: true,
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                  return states.contains(WidgetState.focused)
                      ? null
                      : Colors.transparent;
                }),
                labelStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: (MediaQuery.of(context).size.width / 20 > 45)
                        ? 45
                        : MediaQuery.of(context).size.width / 20),
                unselectedLabelStyle: TextStyle(
                    color: AppColors.grey,
                    fontSize: (MediaQuery.of(context).size.width / 20 > 45)
                        ? 45
                        : MediaQuery.of(context).size.width / 20),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 5.0),
                    insets: EdgeInsets.symmetric(horizontal: 16.0)),
                tabs: [
                  Tab(
                    child: Text(
                      'New Arrival',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'BMW',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Audi',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Toyota',
                    ),
                  ),
                  Tab(
                    child: Text('Mahindra'),
                  )
                ]),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(itemCount: 100,itemBuilder: (context,index){
                  return CarBookingListCard(name: carList[index%carList.length]['name'],type: carList[index%carList.length]['type'], price: carList[index%carList.length]['price'],image: carList[index%carList.length]['image'],);
                }),
                ListView.builder(itemCount: 100,itemBuilder: (context,index){
                  if(carList[index%carList.length]['name']=='BMW'){
                    return CarBookingListCard(name: carList[index%carList.length]['name'],type: carList[index%carList.length]['type'], price: carList[index%carList.length]['price'],image: carList[index%carList.length]['image'],);
                  }
                  return SizedBox.shrink();
                }),
                ListView.builder(itemCount: 100,itemBuilder: (context,index){
                  return CarBookingListCard(name: carList[index%carList.length]['name'],type: carList[index%carList.length]['type'], price: carList[index%carList.length]['price'],image: carList[index%carList.length]['image'],);
                }),
                ListView.builder(itemCount: 100,itemBuilder: (context,index){
                  if(carList[index%carList.length]['name']=='BMW'){
                    return CarBookingListCard(name: carList[index%carList.length]['name'],type: carList[index%carList.length]['type'], price: carList[index%carList.length]['price'],image: carList[index%carList.length]['image'],);
                  }
                  return SizedBox.shrink();
                }),
                ListView.builder(itemCount: 100,itemBuilder: (context,index){
                  return CarBookingListCard(name: carList[index%carList.length]['name'],type: carList[index%carList.length]['type'], price: carList[index%carList.length]['price'],image: carList[index%carList.length]['image'],);
                }),
              ]),
            ),


          ],
        ),
      ),
    );
  }
}
