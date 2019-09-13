import 'package:flutter/material.dart';
import 'package:semart_tech/components/categoryParent.dart';
import 'package:semart_tech/screens/attachment.dart';
import 'package:semart_tech/screens/caseInformation.dart';
import 'package:semart_tech/screens/comment.dart';
import 'package:semart_tech/screens/caseInf.dart';

class Menu extends StatefulWidget{
  MenuState createState()=>MenuState();
}

class MenuState extends State<Menu>
{ 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Case Information'),
                  onPressed: (){newCase();},
                ),
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     FlatButton(
            //       child: Text('Bug Dropdown'),
            //       onPressed: (){bugDropdown();},
            //     ),
            //   ],
            // ),
          Row(children: <Widget>[
            FlatButton(
              child: Text('Comment'),
              onPressed: (){newComment();}
            )
          ],),
          Row(children: <Widget>[
            FlatButton(
              child: Text('Attachment'),
              onPressed: (){newAttachment();}
            )
          ],),
          Row(children: <Widget>[
            FlatButton(
              child: Text('GridView Image'),
              onPressed: (){Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context)=>CategoryParent()));}
            )
          ],)
          ],
        ),
      ),
    );
  }

  void newCase(){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CaseInformation()));
  }

  void bugDropdown(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CaseInf()));
  }

  void newComment(){
     Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Comment()));
  }

  void newAttachment(){
     Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Attachment()));
  }
}