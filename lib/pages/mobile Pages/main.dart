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
  bool isBoxReady = false;

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  Future<void> openHiveBox() async {
    await Hive.openBox('locksmith');
    setState(() {
      isBoxReady = true; // Update state only once
    });
  }
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return  Scaffold(
          backgroundColor: bgcolor,
        body: Center(
          child: Hive.box('locksmith').containsKey('key') ?Login():Firstuse(),
        ),
        );
  }
}