import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:peg/pages/home.dart';
import 'package:peg/password.dart';
import 'package:peg/sql/sqldb.dart';
import 'package:peg/util.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  Password pass=Password();
  Sqldb sqldb=Sqldb();
  void save() async{
    pass.encrypt();
    int response=await sqldb.insertData('''
      INSERT INTO passwords('platform','username','original','encryption') VALUES 
      ('${pass.platform}','${pass.username}','${pass.password}','${pass.secure}')
    ''');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          title: Center(
            child: Text(
              'Tap to copy your password',
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
                                    onPressed: () async{
                                      await Clipboard.setData(ClipboardData(text:pass.secure));
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Copied to clipboard'),
                                      ));
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('COPY',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ],
                            );
      }
      
      );
  }
  @override
  Widget build(BuildContext context) {
    final _platformController = TextEditingController();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(title: Center(child: Text("Add Credential",style: TextStyle(color: Colors.white),)),backgroundColor:gray,),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              controller: _platformController,
              decoration: InputDecoration(
                labelText: "Platform",
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.web,color: purple,),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username / Email",
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.person,color: purple,),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.lock,color: purple,),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                ),
                onPressed: () {
                  save();
                },
                child: Text("Save",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}