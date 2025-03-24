import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Mainpage extends StatefulWidget {
  final Widget mobile;
  final Widget desktop;
  const Mainpage({super.key, required this.mobile,required this.desktop});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context,Constraints){
          if(Constraints.maxWidth<1000){
            return widget.mobile;
          }
          else{
            return widget.desktop;
          }
        }
        )
    );
  }
}