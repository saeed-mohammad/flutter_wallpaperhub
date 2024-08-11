import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/data.dart';
import '../model/wallpaper_model.dart';
import '../widget/appBarWidget.dart';
import 'home.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  Search({
    super.key,
    required this.searchQuery
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = [];

  @override
  void initState() {
    super.initState();
    getTrendingWallpaper(widget.searchQuery);
  }

  Future<void> getTrendingWallpaper(String query) async {
    String url = 'https://api.pexels.com/v1/search?query=$query&per_page=20';
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
    return Scaffold(
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
            WallPaperList(wallpapers: wallpapers, context: context)
          ],
        ),
      ),
    );
  }
}
