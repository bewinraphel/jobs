    
 
 
 
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<WordResponse>> fetchAlbum() async {

  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'));
 if(response.statusCode ==200){
final parsonBody = response.body;

 return wordResponseFromJson(parsonBody);
 }else {
   throw const Text("api error");
 }
  
}



List<WordResponse> wordResponseFromJson(String str) {
  return List<WordResponse>.from(json.decode(str).map((x) {
    return WordResponse.fromJson(x);
  }));
}

String wordResponseToJson(List<WordResponse> data) {
  return json.encode(List<dynamic>.from(data.map((x) {
    return x.toJson();
  })));
}

class WordResponse {
    WordResponse({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    int ?postId;
    int ?id;
    String ?name;
    String ?email;
    String ?body;

    factory WordResponse.fromJson(Map<String, dynamic> json) => WordResponse(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   late Future<List<WordResponse>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body:FutureBuilder<List<WordResponse>>(
          future: futureAlbum,
          
          builder: (context,snapshot){
            if(snapshot.hasData){
              
              List<WordResponse>?  album= snapshot.data;
           
              return ListView.builder(
                itemCount:album!.length ,
                itemBuilder: (BuildContext context, index){
                  return Column(
                    children: [
                      Text(album[0].email.toString()),
                        Text(album[0].postId.toString()),
                          Text(album[0].name.toString()) 
                    ],
                  );

                }


              );
            }else{  return    const CircularProgressIndicator();}
          })
        ),
      );
    
  }
}
