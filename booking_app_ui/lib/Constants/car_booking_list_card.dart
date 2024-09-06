import 'package:flutter/material.dart';

import 'color.dart';

class CarBookingListCard extends StatelessWidget {
  final name;
  final type;
  final image;
  final price;
  const CarBookingListCard({super.key, required this.name, this.type, this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,top: 10,bottom: 10),
      height: MediaQuery.of(context).size.width/3.5,
      decoration: BoxDecoration(
          color: AppColors.dark_grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      child: Stack(
          children:[ Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width/20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width/25,),
                  Text(
                    name,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize:
                        MediaQuery.of(context).size.width / 25),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    type,
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize:
                        MediaQuery.of(context).size.width / 30),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Spacer(),
              Image.asset('assets/$image',)
            ],
          ),
            Positioned(
              left: -1,
              bottom: MediaQuery.of(context).size.width/20,
              child: Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
                  height: MediaQuery.of(context).size.width/15,
                  width: MediaQuery.of(context).size.width/6,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MediaQuery.of(context).size.width/45),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width/50)),
                  ),
                  child: Text(
                    "\$$price",
                    style: TextStyle(
                        color: AppColors.black,fontSize: MediaQuery.of(context).size.width/30),
                  )),
            )
          ]
      ),
    );
  }
}
