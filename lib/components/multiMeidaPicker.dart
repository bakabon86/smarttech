import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:multiple_image_picker/multiple_image_picker.dart';

class MultiMediaPage extends StatefulWidget {
  @override
  _MultiMediaPageState createState() => new _MultiMediaPageState();
}

class _MultiMediaPageState extends State<MultiMediaPage> {
  File _image;

  Future getImage() async {
    //var image = await ImagePicker.pickImage(source: ImageSource.camera, numberOfItems: 1);
    //var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      //_image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker Example'),
      ),
      body: new Center(
        child: _image == null
            ? new Text('No image selected.')
            : new Image.file(_image),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}