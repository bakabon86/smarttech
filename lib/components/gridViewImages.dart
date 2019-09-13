import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:semart_tech/components/viewImages.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';


class GridViewImages extends StatefulWidget {
  GridViewImages({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GridViewImagesState createState() => _GridViewImagesState();
}

class _GridViewImagesState extends State<GridViewImages> {
  // List<Asset> _images = List();
  // String _error = '';

  // void _pickImages() async {
  //   List<Asset> resultList = List<Asset>();
  //   String error = '';

  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 300,
  //     );
  //   } on PlatformException catch (e) {
  //     error = e.message;
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     _images = resultList;
  //     _error = error;
  //   });
  // }

  // Widget _getContent() {
  //   if (_error.length > 0) {
  //     return Center(
  //       child: Text(_error),
  //     );
  //   }

  //   if (_images.length == 0) {
  //     return Center(
  //       child: Text('Please select some images ...'),
  //     );
  //   }

  //   return PageView.builder(
  //     itemBuilder: (context, index) {
  //       return Center(
  //         child: ViewImages(
  //           _images[index],
  //           key: UniqueKey(),
  //         ),
  //       );
  //     },
  //     itemCount: _images.length,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View Images"),
      ),
      //body: _getContent(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _pickImages,
      //   tooltip: 'Pick Images',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}