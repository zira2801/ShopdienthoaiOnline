import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop/page/homepage.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,
  home: HomePage(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Home',style: TextStyle(color: Colors.white),),backgroundColor: Colors.amber,));
  }
}
