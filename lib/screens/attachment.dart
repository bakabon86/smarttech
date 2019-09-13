import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:semart_tech/helpers/global.dart';
import 'package:semart_tech/screens/applicationMenu.dart';
//import 'package:semart_tech/services/repository.dart';

class Attachment extends StatefulWidget {
  AttachmentState createState() => AttachmentState();
}

class AttachmentState extends State<Attachment> {
  String url;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Attachment'),
        ),
        body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  makeBody(),
                ],
              ),
              Row(
                children: <Widget>[
                  submitButton(),
                ],
              ),
            ],
          ),
        ));
  }

  Widget makeBody() {
    return new Container(
      height: 100,
      child: Column(
        children: <Widget>[
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),
          ),
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return new RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text("Submit"),
      onPressed: sendAttachment,
    );
  }

  void sendAttachment() async {
    //  token: token;
    //  number: number;
    appData.user= 'customer';
    //  time: time;
    //   kind: kind;
    url = _image as String;
    // await Repository().sendAttachment(token, number, user, time, kind, url);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Menu()));
  }
}
