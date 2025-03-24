import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,toolbarHeight: 10,),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenheight*0.25,
            ),
            Container(
              height: screenheight*0.4,
              width: screenwidth*0.8,
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color:const Color.fromARGB(255, 150, 0, 150), blurRadius: 20, spreadRadius: 5)],
                color: const Color.fromARGB(255, 31, 31, 31),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Image.asset('assets/icons8-lock-96.png',),
                  Text(
                    "W E L C O M E",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: screenheight*0.03,
                  ),
                  Container(
                    width: screenwidth*0.7,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter your key . . .',
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 150, 150, 150)
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 150, 0, 150),
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenheight*0.05,
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color:  const Color.fromARGB(255, 150, 0, 150),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: TextButton(
                      onPressed: (){}, 
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        )
                      
                      ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}