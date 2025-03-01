import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  XFile? file;
  final ImagePicker picker=ImagePicker();

  _pickImage()async{
    final XFile? photo=(await picker.pickImage(source: ImageSource.gallery))!;
    setState(() {
      file=photo;
    });
  }

  _pickMultiImage()async{
    final List<XFile?> photos=await  picker.pickMultiImage();
    for(int i=0;i<photos.length;i++){
      print(photos[i]?.path.toString());
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Container(
            height: 500,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: file==null?Center(child: Text("No file")): Image.file(File(file!.path))  ,
          ),
          ElevatedButton(onPressed: (){
            _pickImage();
          }, child: Text("Click to pick")),
          ElevatedButton(onPressed: (){
            _pickMultiImage();
          }, child: Text("Click to Multiple pick")),
        ],
      ),
    );
  }
}