import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:wallpaperhub/model/categories_model.dart';
import 'package:wallpaperhub/views/search.dart';
import 'package:wallpaperhub/widget/appBarWidget.dart';
import '../data/data.dart';
import '../model/wallpaper_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});
//apikey Authorization: 7zcBWKEJGdXxpp7GwkxflI5PRUfAzjaSUx70QjXte5hAaCpZJnPkLXW0
// api :  https://api.pexels.com/v1/search?query=people
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];
  @override
  void initState()  {
    super.initState();
    categories = getCategories();
    getTrendingWallpaper();
  }

  Future<void> getTrendingWallpaper() async {
    String url = 'https://api.pexels.com/v1/curated?per_page=20';
    List<WallpaperModel> wallpaper = [];
    try{
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':apiKey
        }
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<WallpaperModel> wallpaperList = [];

          jsonData['photos'].forEach((element) {
            wallpaperList.add(WallpaperModel.fromJson(element));
        });

        setState(() {
          wallpapers = wallpaperList;
        });

        // Print wallpapers after setting state
        wallpapers.forEach((wallpaper) {
          // print('Photographer: ${wallpaper.photographer}');
          // print('Photographer URL: ${wallpaper.photographerUrl}');
          print('Photographer ID: ${wallpaper.photographerId}');
          // print('Image URL: ${wallpaper.src.portrait}');
        });

      } else {
        throw Exception('Failed to load wallpapers: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load wallpapers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: appBarWidget(txtOne: "Wallpaper", txtTwo: "hub", ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(),
        
            SizedBox(height: 16,),

            appBarWidget(txtOne: "Made By ", txtTwo: "Mohd Saeed", ),

            SizedBox(height: 16,),

            Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    child: CategoriesTile(
                      imgUrl: categories[index].imgUrl,
                      title: categories[index].categoryName,
                    ),
                    onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> Search(searchQuery: categories[index].categoryName,))
                        );
                      },
                  );
                }
              ),
            ),

            WallPaperList(wallpapers: wallpapers, context: context)
          ],
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget  {
  final String imgUrl, title;
   const CategoriesTile({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imgUrl,height: 50, width: 100, fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.center,
            height: 50, width: 100,
            // color: Colors.black26,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8), // Set the border radius
            ),
            child: Text(
              title,
              style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15
              ) ,),
          )
        ],
      ),
    );
  }
}


class SearchWidget extends StatelessWidget {
    SearchWidget({
    super.key,
  });

  final TextEditingController _controller = TextEditingController();

  // @override
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff5f8fd),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "search wallpaper",
                border: InputBorder.none
              ),
            ),
          ),
          InkWell(
              child: Icon(Icons.search),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Search(searchQuery: _controller.text,))
                );
              },
          )
        ],
      ),
    );
  }
}
