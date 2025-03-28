import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:peg/pages/desktop%20Pages/dfirstuse.dart';
import 'package:peg/pages/desktop%20Pages/dlogin.dart';
import 'package:peg/util.dart';
Future<void> openHiveBox() async {
  await Hive.openBox('locksmith');
}
class Dmain extends StatefulWidget {
  const Dmain({super.key});

  @override
  State<Dmain> createState() => _DmainState();
}

class _DmainState extends State<Dmain> {
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: openHiveBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white,); // Show a loader while opening
        } else if (snapshot.hasError) {
          return Text("Error opening Hive box");
        }
        return Scaffold(
          backgroundColor: bgcolor,
        body: Center(
          child: Row(
            children: [
              Image.asset(
                'assets/sidepic.png',
                width: screenwidth*0.45,
              ),
              Hive.box('locksmith').containsKey('key') ?Dlogin():Dfirstuse()
            ],
          ),
        ),
        );
      },
    );
  }
}