import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:peg/pages/mobile%20Pages/home.dart';

class Dlogin extends StatelessWidget {
  const Dlogin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    final box=Hive.box('locksmith');
    TextEditingController key=TextEditingController();
    return Container(
              margin: EdgeInsets.only(left: screenwidth*0.15),
              height: screenheight*0.6,
              width: screenwidth*0.3,
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color:const Color.fromARGB(255, 150, 0, 150), blurRadius: 20, spreadRadius: 5)],
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  SizedBox(height: screenheight*0.08,),
                  Image.asset('assets/icons8-lock-96.png',),
                  //SizedBox(height: screenheight*0.02,),
                  Text(
                    "W E L C O M E",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: screenheight*0.05,),
                  Container(
                    width: screenwidth*0.25,
                    child: TextField(
                      controller: key,
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
                    width: screenwidth*0.1,
                    height: screenheight*0.05,
                    decoration: BoxDecoration(
                      color:  const Color.fromARGB(255, 150, 0, 150),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: TextButton(
                      onPressed: (){
                        if(key.text==box.get('key')){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                        }
                        else{
                          showDialog(
                          context: context, 
                          builder:(context){
                            return AlertDialog(
                              backgroundColor: const Color.fromARGB(255, 58, 58, 58),
                              title: Center(
                                child: Text(
                                'WRONG KEY',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 255, 255, 255)
                                  ),
                                )),
                              actions: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 150, 0, 150),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('try again',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ],
                            );
                          }
                          );
                        }
                      },
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
            );
  }
}