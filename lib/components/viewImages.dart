import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:multi_image_picker/asset.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';

class ViewImages extends StatefulWidget {
  //final Asset _asset;

  // ViewImages(
  //   this._asset, {
  //   Key key,
  // }) : super(key: key);

  // @override
  // State<StatefulWidget> createState() => ViewImagesState(this._asset);
  ViewImagesState createState()=>ViewImagesState();
}

class ViewImagesState extends State<ViewImages> {
  // Asset _asset;
  // ViewImagesState(this._asset);

  // @override
  // void initState() {
  //   super.initState();
  //   _loadImage();
  // }

  // void _loadImage() async {
  //   //await this._asset.requestThumbnail(300, 300, quality: 50);
  //   await this._asset.getThumbByteData(300, 300, quality: 50);

  //   if (this.mounted) {
  //     setState(() {});
  //   }
  // }

  // checkThumbData() async {
  //   ByteData byteData = await this._asset.getByteData();
  //   if (null != this._asset.getByteData()) {
  //     return Image.memory(
  //       byteData.buffer.asUint8List(),
  //       fit: BoxFit.cover,
  //       gaplessPlayback: true,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // if (null != this._asset.thumbData) {
    //   return Image.memory(
    //     this._asset.thumbData.buffer.asUint8List(),
    //     fit: BoxFit.cover,
    //     gaplessPlayback: true,
    //   );
    // }
    //checkThumbData();

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
