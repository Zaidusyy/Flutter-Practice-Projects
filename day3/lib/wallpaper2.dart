import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper/flutter_wallpaper.dart';

class Wallpaper2 extends StatefulWidget {
  final String image,category;
  const Wallpaper2({super.key, required this.image,required this.category});

  @override
  State<Wallpaper2> createState() => _Wallpaper2State();
}

class _Wallpaper2State extends State<Wallpaper2> {


   setWallpaper(int location, String screenType) async {
    var file = await DefaultCacheManager().getSingleFile(widget.image);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        closeIconColor: Colors.white,
        duration: Duration(milliseconds: 800),
        padding: EdgeInsets.all(10),
        backgroundColor: result ? Colors.green : Colors.red,
        content: Text(
          result ? "Wallpaper set successfully for $screenType" : "Failed to set wallpaper for $screenType",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }

   setWallpaperLock() => setWallpaper(WallpaperManager.lockScreen, "Lock Screen");
   setWallpaperHome() => setWallpaper(WallpaperManager.homeScreen, "Home Screen");
   setWallpaperBoth() => setWallpaper(WallpaperManager.bothScreen, "Both Screens");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Center(
            child: Hero(
                        tag: "${widget.category}-${widget.image}",
                        child: Container(
            height: 480,
              width: 270,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(widget.image), fit: BoxFit.cover))),
                      ),
          ),
          ElevatedButton(
              onPressed: () {
                setWallpaperLock();
              },
              child: Text(
                'Set Wallpaper on Lock Screen',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          ElevatedButton(
              onPressed: () {
                setWallpaperHome();
              },
              child: Text(
                'Set Wallpaper on Home Screen',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          ElevatedButton(
              onPressed: () {
               setWallpaperBoth();
              },
              child: Text(
                'Set Wallpaper on Both Screen',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // ElevatedButton(
          //     onPressed: () async{
          //     int location=WallpaperManager.bothScreen;
          //     var result=await WallpaperManager.clearWallpaper();
          //     },
          //     child: Text(
          //       'Set Default Wallpaper on Both Screen',
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     )),
          SizedBox()
        ],
      ),
    );
  }
}
