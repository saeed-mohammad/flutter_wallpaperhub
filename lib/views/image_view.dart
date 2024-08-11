
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  const ImageView({super.key, required this.imgUrl});


  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Hero(
              tag: widget.imgUrl,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imgUrl, fit: BoxFit.cover,),
              ),
            ),

            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Align(
            //         // alignment: Alignment.center,
            //         child: Container(
            //           // padding: EdgeInsets.symmetric( vertical: 12),
            //           // color: Color(0xff1C1B1B).withOpacity(0.8),
            //           alignment: Alignment.bottomCenter,
            //           width: MediaQuery.of(context).size.width/2,
            //           decoration: BoxDecoration(
            //
            //             border: Border.all(color: Colors.white60),
            //             borderRadius: BorderRadius.circular(50),
            //             gradient: LinearGradient(
            //               colors: [
            //                 Color(0x36FFFFFF),
            //                 Color(0x0FFFFFFF),
            //               ]
            //             )
            //           ),
            //
            //           child:  Column(
            //             children: [
            //               Text(
            //                   "Set Wallpaper",
            //                   style: TextStyle(
            //                       fontSize: 18,
            //                       color: Colors.white
            //                   ),
            // ),
            //               Text(
            //                 "Image will save in gallery",
            //                 style: TextStyle(
            //                     fontSize: 14,
            //                     color: Colors.white
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20,),
            //       Text("Cancel", style: TextStyle(
            //           fontSize: 15,
            //           color: Colors.white
            //       ),),
            //       SizedBox(height: 30,)
            //     ],
            //   ),
            // ),
            //
          ],
        ),
      ),
    );
  }
}
