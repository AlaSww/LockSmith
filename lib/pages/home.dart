import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:peg/pages/addpage.dart';
import 'package:peg/password.dart';
import 'package:peg/sql/sqldb.dart';
import 'package:peg/util.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Sqldb sqldb=Sqldb();
  bool isvisible=false;
  List passwords= [];
  List foundpasswords=[];
  void getpasswords() async{
    List<Map> response= await sqldb.readData("select * from passwords");
    print(response);
    passwords.addAll(response);
    if(mounted){
      setState(() {
        
      });
    }
  }
  void search(String entered){
    List result=[];
    if(entered.isEmpty){
      result=passwords;
    }
    else{
      result=passwords.where((platform)=>platform["platform"].toString().toLowerCase().contains(entered.toLowerCase())).toList();
    }
    setState(() {
      foundpasswords=result;
    });
  }
  @override
  void initState() {
    getpasswords();
    foundpasswords=passwords;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    TextEditingController pass=TextEditingController();
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Center(child: Text('Locksmith',style: TextStyle(color: Colors.white),)),
        leading: Icon(Icons.key,color: Colors.white,),
        actions: [
          IconButton(
            icon: Icon(Icons.settings,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔑 Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: screenheight*0.055,
                  width: screenwidth*0.45,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gray,
                    ),
                    icon: Icon(Icons.lock,color: purple,),
                    label: Text("Generate Password",style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      showDialog(
                          context: context, 
                          builder:(context){
                            return AlertDialog(
                              backgroundColor: const Color.fromARGB(255, 58, 58, 58),
                              title: Center(
                                child:TextField(
                                    controller: pass,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Enter your short password. . .',
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
                              actions: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 150, 0, 150),
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: TextButton(
                                    onPressed: () async{
                                      Password p=Password();
                                      p.password=pass.text;
                                      p.encrypt();
                                      await Clipboard.setData(ClipboardData(text:p.secure));
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Copied to clipboard'),
                                      ));
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Generate',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ],
                            );
                          }
                          );
                    }, 
                  ),
                ),
                SizedBox(
                  height: screenheight*0.055,
                  width: screenwidth*0.45,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gray,
                    ),
                    icon: Icon(Icons.add,color: purple,),
                    label: Text("Add Password",style: TextStyle(color: Colors.white)),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Addpage()));}, 
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 🔍 Search Bar
            TextField(
              onChanged: (value)=>search(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search passwords...",
                hintStyle: TextStyle(color: const Color.fromARGB(255, 160, 160, 160)),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color: purple,
                      width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount:foundpasswords.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      tileColor: gray,
                      leading: Icon(Icons.security,color: purple,), 
                      title: !isvisible 
                      ?Text("Platform: ${foundpasswords[index]['platform']}",style: TextStyle(color: Colors.white))
                      :Text("Password: ${foundpasswords[index]['original']}",style: TextStyle(color: Colors.white)),
                      subtitle: Text("User:${foundpasswords[index]['username']}",style: TextStyle(color: Colors.white)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: !isvisible ?Icon(Icons.visibility,color: const Color.fromARGB(255, 218, 218, 218),):Icon(Icons.visibility_off,color: const Color.fromARGB(255, 202, 202, 202),),
                            onPressed: () {
                              setState(() {
                                isvisible=!isvisible;
                                print(isvisible);
                              });
                            }, 
                          ),
                          IconButton(
                            icon: Icon(Icons.copy,color: const Color.fromARGB(255, 218, 218, 218)),
                            onPressed: () async{
                              await Clipboard.setData(ClipboardData(text: foundpasswords[index]['original']));
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Copied to clipboard'),
                              ));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete,color: const Color.fromARGB(255, 255, 0, 0)),
                            onPressed: () async{
                              int response=await sqldb.deleteData("delete from passwords where id=${foundpasswords[index]['id']}");
                              if(response>0){
                                passwords.removeWhere((item)=> item['id'] == foundpasswords[index]['id']);
                                print("After deletion: ${passwords.length}");
                                foundpasswords.removeWhere((item)=> item['id'] == foundpasswords[index]['id']);
                                setState(() {
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      

      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        child: Icon(Icons.add,color:const Color.fromARGB(255, 218, 218, 218),size: 40,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Addpage()));
        }, 
      ),
    );
  }
}
