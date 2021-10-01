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
  Future selectImage() async {
    final List<XFile>? selectedImage = await _picker.pickMultiImage();
    if (selectedImage!.isNotEmpty) {
      _imageFileList!.addAll(selectedImage);
    }
    // ignore: avoid_print
    print(_imageFileList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
            floatingActionButton:  FloatingActionButton(onPressed: selectImage, child: const Icon(Icons.add_a_photo)),
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Expanded(
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: GridView.builder(
                  itemCount: _imageFileList!.length,
            
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                      
                  itemBuilder: (BuildContext context, int index) {
                    // ignore: avoid_unnecessary_containers
                    return Container(child: Card(child: GridTile(child:  Image.file(File(_imageFileList![index].path))),));
                  }),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
