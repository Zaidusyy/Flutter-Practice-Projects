import 'package:flutter/material.dart';

import 'color.dart';

class CustomHotelCard extends StatelessWidget {
  final imageurl;
  final name1;
  final name2;
  final price;
  const CustomHotelCard({super.key, required this.imageurl, required this.name1, required this.name2, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.dark_grey,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              children: [Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 2 - 20,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            imageurl),
                        fit: BoxFit.cover)),
              ),
                Positioned(
                  right: -1,
                  top: 10,
                  child: Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),
                      height: MediaQuery.of(context).size.width/15,
                      width: MediaQuery.of(context).size.width/6,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(MediaQuery.of(context).size.width/45),
                            bottomLeft: Radius.circular(MediaQuery.of(context).size.width/50)),
                      ),
                      child: Text(
                        "\$$price",
                        style: TextStyle(

                            color: AppColors.white,fontSize: MediaQuery.of(context).size.width/30),
                      )),
                ),
              ]
          ),
          Text(
            name1,
            style: TextStyle(color: AppColors.white, fontSize: MediaQuery.of(context).size.width/20,fontWeight: FontWeight.bold),
          ),
          Text(
            name2,
            style: TextStyle(color: AppColors.grey, fontSize: MediaQuery.of(context).size.width/30),
          ),

        ],
      ),
    );
  }
}
