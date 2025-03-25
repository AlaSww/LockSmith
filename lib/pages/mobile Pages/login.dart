import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:peg/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    final box=Hive.box('locksmith');
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    TextEditingController key = TextEditingController();
    return Container(
              height: screenheight*0.4,
              width: screenwidth*0.8,
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color:const Color.fromARGB(255, 241, 130, 241), blurRadius: 20, spreadRadius: 5)],
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Image.asset('assets/icons8-lock-96.png',),
                  Text(
                    "W E L C O M E",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: screenheight*0.03,
                  ),
                  Container(
                    width: screenwidth*0.7,
                    child: TextField(
                      obscureText: true,
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
                    width: 100,
                    height: 40,
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