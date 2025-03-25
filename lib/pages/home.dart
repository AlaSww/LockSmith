import 'package:flutter/material.dart';
import 'package:peg/util.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    bool isvisible=false;
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
                    onPressed: () {}, 
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
                    onPressed: () {}, 
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 🔍 Search Bar
            TextField(
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
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      tileColor: gray,
                      leading: Icon(Icons.security,color: purple,), 
                      title: Text("Website/App Name",style: TextStyle(color: Colors.white)),
                      subtitle: Text("Username",style: TextStyle(color: Colors.white)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: isvisible==false ?Icon(Icons.visibility,color: const Color.fromARGB(255, 218, 218, 218),):Icon(Icons.visibility_off,color: const Color.fromARGB(255, 202, 202, 202),),
                            onPressed: () {
                              
                            }, 
                          ),
                          IconButton(
                            icon: Icon(Icons.copy,color: const Color.fromARGB(255, 218, 218, 218)),
                            onPressed: () {},
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
        onPressed: () {}, 
      ),
    );
  }
}
