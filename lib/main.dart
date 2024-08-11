import 'package:flutter/material.dart';
import 'package:wallpaperhub/views/home.dart';
//7zcBWKEJGdXxpp7GwkxflI5PRUfAzjaSUx70QjXte5hAaCpZJnPkLXW0
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallpaperHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home:const Home(),
    );
  }
}

