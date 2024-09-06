import 'package:flutter/material.dart';

import 'color.dart';

class CustomMenuBox extends StatelessWidget {
  final name;
  final icon;
  final ontap;
  const CustomMenuBox({super.key,required this.name,required this.icon,this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap:ontap,
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width/50),
        width: MediaQuery.of(context).size.width/5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.mid_grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: AppColors.white,
              size: MediaQuery.of(context).size.width/8,
            ),
            Text(name,style:TextStyle(color: AppColors.white,fontSize:MediaQuery.of(context).size.width/40 ),),
          ],
        ),
      ),
    );
  }
}
