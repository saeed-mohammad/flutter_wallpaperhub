import 'package:flutter/material.dart';
import 'package:wallpaperhub/views/image_view.dart';

import '../model/wallpaper_model.dart';

Widget appBarWidget({required String txtOne,required String txtTwo}){
  return RichText(
    text: TextSpan(
      text: txtOne,
      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16),
      children: <TextSpan>[
        TextSpan(
            text: txtTwo,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold
            )
        ),
      ],
    ),
  );
}

Widget WallPaperList({required List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children:
        wallpapers.map((wallpaper){
          return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>ImageView(imgUrl: wallpaper.src.portrait)));
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      wallpaper.src.portrait,
                      fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
          // Image.network(e.src.portrait)
        }).toList()
    ),
  );
}