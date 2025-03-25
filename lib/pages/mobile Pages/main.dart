import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:peg/pages/mobile%20Pages/firstuse.dart';
import 'package:peg/pages/mobile%20Pages/login.dart';
import 'package:peg/util.dart';
Future<void> openHiveBox() async {
  await Hive.openBox('locksmith');
}
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: openHiveBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white,); 
        } else if (snapshot.hasError) {
          return Text("Error opening Hive box");
        }
        return Scaffold(
          backgroundColor: bgcolor,
        body: Center(
          child: Hive.box('locksmith').containsKey('key') ?Login():Firstuse(),
        ),
        );
      },
    );
  }
}