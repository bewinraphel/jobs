
 
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

import 'package:flutter/material.dart';
import 'package:images1/listview.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 


 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Its just simble project"),
        ),
        body: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 9),
              child: SizedBox(
                height: 50,
                child: ListTile(
                  title: Text(
                    "Based on your recent activity",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
           StoryScetion(),
       
          ],
        ),
      ),
    );
  }
}

