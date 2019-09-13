import 'package:flutter/material.dart';

class CaseInf extends StatefulWidget{
   
    CaseInfState createState()=> CaseInfState();
}

class CaseInfState extends State<CaseInf>{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(title: Text('BuG Dropdown'),),
      body: new _RecreateScreen(),
    );
  }
}

class CustomObject extends Object {
  String fieldName;
  int specialNumber = 3;
  double otherNumber = 42.0;

  CustomObject(this.fieldName);

  ///Just evaluate on the name
  bool operator ==(o) => o is CustomObject && o.fieldName == fieldName;   //New
  int get hashCode => fieldName.hashCode;                                 //New
}

class _RecreateScreen extends StatefulWidget{
  _RecreateScreenState createState()=>_RecreateScreenState();
}

class _RecreateScreenState extends State<_RecreateScreen> {
  CustomObject currentlySelectedObject;                            //New
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<CustomObject>> items = <DropdownMenuItem<CustomObject>>[];

    items.add(getItem("First"));
    items.add(getItem("Second"));
    items.add(getItem("Third"));

    return new Scaffold(
      body: new DropdownButton<CustomObject>(
        value: currentlySelectedObject,                             //New
        items: items,
        onChanged: (CustomObject o){
          if (o == null) {
            print("Object was null!");
          } else {
            currentlySelectedObject = o;                            //New
            print("Item was selected and non-null!");
          }
        },
      ),
    );
  }

  DropdownMenuItem<CustomObject> getItem(String name) {
    CustomObject object = new CustomObject(name);
    return new DropdownMenuItem(
      value: object,
      child: new Text(object.fieldName),
    );
  }
}