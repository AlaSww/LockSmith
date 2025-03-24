import 'package:flutter/material.dart';
import 'package:peg/pages/desktop%20Pages/dmain.dart';
import 'package:peg/pages/mainPage.dart';
import 'package:peg/pages/mobile%20Pages/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'peg',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: Mainpage( mobile: Main(),desktop: Dmain()), 
    );
  }
}