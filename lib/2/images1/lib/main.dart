import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  final List<XFile>? _imageFileList = [];

 deletedimage(index){
   // ignore: avoid_print
   print(index);
   setState(() {
     _imageFileList!.removeAt(index);
   });
 }  
  Future selectImage() async {
    final List<XFile>? selectedImage = await _picker.pickMultiImage();

    if (selectedImage!.isNotEmpty) {
      _imageFileList!.addAll(selectedImage);
    
    }

    setState(() {
      _imageFileList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      
        appBar: AppBar(
          title: const Text("djhdjhdj"),
        ),
        body: SizedBox(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                height: 100,
                width: 90,
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          color: Colors.black,
                          onPressed: selectImage,
                          icon: const Icon(Icons.add)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _imageFileList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.red,
                          child: Stack(children: [
                            Image.file(
                              File(_imageFileList![index].path),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                  iconSize: 30,
                                  color: Colors.red[258],
                                  onPressed: (){
                                    deletedimage(index);
                                   
                                  },
                                  icon: const Icon(Icons.remove)),
                            ),
                          ]),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
