import 'dart:convert';
import 'package:day3/wallpaper2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getphotos();

    getAllPhotos();
  }

  // List<String> list = [];

  // getphotos() async {
  //   final response = await http.get(
  //       Uri.parse('https://api.pexels.com/v1/curated?page=2&per_page=80'),
  //       headers: {
  //         "Authorization":
  //             "1wboIPOZMbHmQNRXpwsGNVN8F4QPbFPI4PHicC3yxfj8K6RvgCCbNWhq"
  //       });
  //
  //   final result = jsonDecode(response.body);
  //   //print(result['photos']);
  //   print(result['photos'][0]['src']['portrait'].toString());
  //
  //   for (int i = 0; i < result['photos'].length; i++) {
  //     list?.add(result['photos'][i]['src']['portrait'].toString());
  //   }
  //
  //   setState(() {
  //     list.addAll([]);
  //   });
  // }

  Map<String, List<String>> wallpapers = {
    "Popular": [],
    "Nature": [],
    "Abstract": [],
    "Dark / AMOLED": [],
    "Technology & Sci-Fi": [],
    "Space": [],
    "Couple": [],
    "Islamic": [],
    "Hinduism": [],
    "Christianity": [],
    "Buddhism": [],
    "Sikhism": [],
  };

  Map<String, String> searchQueries = {
    "Popular": "Popular wallpapers",
    "Nature": "Nature wallpaper",
    "Abstract": "Abstract wallpaper",
    "Dark / AMOLED": "Dark wallpaper",
    "Technology & Sci-Fi": "Hacker and Coding Themes",
    "Space": "Space wallpaper",
    "Couple": "Romantic couple wallpaper",
    "Islamic": "Beautiful Islamic calligraphy wallpaper",
    "Hinduism": "Divine Hindu god wallpaper",
    "Christianity": "Christian cross and Jesus wallpaper",
    "Buddhism": "Buddha meditation and temple wallpaper",
    "Sikhism": "Sikhism",
  };


  getPhotos(String category) async {
    final response = await http.get(
      Uri.parse(
        (category=="Popular")?'https://api.pexels.com/v1/curated?per_page=80':'https://api.pexels.com/v1/search?query=${searchQueries[category]}&per_page=80&orientation=portrait'),
      headers: {
        "Authorization":
            "1wboIPOZMbHmQNRXpwsGNVN8F4QPbFPI4PHicC3yxfj8K6RvgCCbNWhq"
      },
    );

    final result = jsonDecode(response.body);

    if (result['photos'] != null) {
      wallpapers[category] = result['photos']
          .map<String>((photo) => photo['src']['portrait'].toString())
          .toList();
      // for(int i=0;i<result['photos'].length;i++){
      //   wallpapers[category]?.add(result['photos'][i]['src']['portrait'].toString());
      // }
    }
  }

   getAllPhotos() async {
    for (var category in searchQueries.keys) {
      await getPhotos(category);
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wallpaper App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: wallpapers.entries
              .map<Widget>(
                  (entry) => _buildWallpaperListWidgets(entry.key, entry.value))
              .toList(),
          // children:
        ),
      ),
    );
  }

  _buildWallpaperListWidgets(String Category, List<String> wallpapers) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Text(
                Category,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          SizedBox(
            height: 162,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                wallpapers.length,
                (index) => InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Wallpaper2(
                                category: Category,
                                image: wallpapers[index].toString())));
                  },
                  child: Hero(
                    tag: "$Category-${wallpapers[index].toString()}",
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 162,
                      width: 91,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(wallpapers[index].toString()),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
