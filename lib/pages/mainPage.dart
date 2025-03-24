import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Mainpage extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  const Mainpage({super.key, required this.mobile,required this.desktop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context,Constraints){
          if(Constraints.maxWidth<1000){
            return mobile;
          }
          else{
            return desktop;
          }
        }
        )
    );
  }
}