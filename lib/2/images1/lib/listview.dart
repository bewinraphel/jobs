import 'dart:io';

import 'package:flutter/material.dart';

//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_core/firebase_core.dart';

import 'package:image_picker/image_picker.dart';

class StoryScetion extends StatefulWidget {
  const StoryScetion({Key? key}) : super(key: key);

  @override
  _StoryScetionState createState() => _StoryScetionState();
}

class _StoryScetionState extends State<StoryScetion> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  final List<XFile>? _imageFileList = [];
  List<dynamic> imageSizes = [];
  Future selectImage() async {
    final List<XFile>? selectedImage =
        await _picker.pickMultiImage(imageQuality: 10);
    setState(() {
      if (selectedImage!.isNotEmpty) {
        _imageFileList!.addAll(selectedImage);
      }
    });
  }

  deletedImage(index) {
    _imageFileList!.removeAt(index);
    setState(() {
      _imageFileList;
    });
  }

  stories() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imageFileList!.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 140,
                width: 100,
                //in these container   the photos and sizes display
                
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                         
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                File(
                                  _imageFileList![index].path,
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      const Text(
                        "Instigram",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        (((File(_imageFileList![index].path).lengthSync()) /
                                    1024 /
                                    1024)
                                .toStringAsFixed(2)) +
                            "MB",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
            Positioned(
              right: -2,
              top: -15,
              child: IconButton(onPressed: (){deletedImage(index);}, icon: const Icon(Icons.remove_circle))),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    // this the list of the PHOTOS
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
             
              width: 100,
              child: Column(children: [
                SizedBox(
                  height: 100,
                  child: IconButton(
                      onPressed: selectImage, icon: const Icon(Icons.add)),
                ),
                const Text(
                  "add photos",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
          stories()
        ],
      ),
    );
  }
}
