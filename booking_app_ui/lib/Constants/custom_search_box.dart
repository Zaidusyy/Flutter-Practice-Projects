import 'package:flutter/material.dart';

import 'color.dart';
class CustomSearchBox extends StatelessWidget {
  final hinttext;
  final suffixicon;
  const CustomSearchBox({super.key,this.hinttext,this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: AppColors.grey),
        suffixIcon: Icon(
          suffixicon,
          color: AppColors.grey,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.grey, width: 5)),
        fillColor: AppColors.dark_grey,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            BorderSide(color: AppColors.mid_grey, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.grey, width: 2)),
      ),
    );
  }
}
