import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:peg/pages/mobile%20Pages/firstuse.dart';
import 'package:peg/pages/mobile%20Pages/login.dart';
import 'package:peg/util.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    final box=Hive.box('locksmith');
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor:bgcolor,toolbarHeight: 10,),
      backgroundColor: bgcolor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenheight*0.25,
            ),
            box.containsKey('key') ?Login():Firstuse()
          ],
        ),
      ),
    );
  }
}