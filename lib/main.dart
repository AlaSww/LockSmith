import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:peg/pages/desktop%20Pages/dmain.dart';
import 'package:peg/pages/mainPage.dart';
import 'package:peg/pages/mobile%20Pages/main.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  await Hive.initFlutter();
  var box=Hive.openBox('locksmith');
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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