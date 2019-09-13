import 'package:flutter/material.dart';

class CustomerList extends StatefulWidget {
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    refresh() {}

    Widget makeBody() => Container(
          height: 100,
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 2,
            shape: Border.all(width: 1),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[Text("Nomer HP")],
                      ),
                      Column(
                        children: <Widget>[Text(":")],
                      ),
                      Column(
                        children: <Widget>[Text("08080808008")],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[Text("Nama")],
                      ),
                      Column(
                        children: <Widget>[Text(":")],
                      ),
                      Column(
                        children: <Widget>[Text("John Doe")],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[Text("Email")],
                      ),
                      Column(
                        children: <Widget>[Text(":")],
                      ),
                      Column(
                        children: <Widget>[Text("john.doe@mailmail.com")],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );

    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(IconData(58837, fontFamily: 'MaterialIcons')),
                  onPressed: refresh())
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index){
            return makeBody();
        },
      ) 
    ));
  }
}
