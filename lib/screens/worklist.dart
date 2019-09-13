import 'package:flutter/material.dart';
import 'package:semart_tech/screens/caseInformation.dart';
import 'package:semart_tech/screens/rating.dart';

class CardApi extends StatefulWidget {
  CardApiState createState() => CardApiState();
}

class CardApiState extends State<CardApi> {
  @override
  Widget build(BuildContext context) {
    Widget makeBody() => Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Text('No Hp :'),
                            Text('Name :'),
                            Text('Email :'),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: <Widget>[
                            Text(''),
                            Text(''),
                            Text(''),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: <Widget>[
                            FlatButton(
                              onPressed: viewDetail,
                              child: Text('View Detail'),
                            ),
                            Text(''),
                            Text(''),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

    return Scaffold(
      //  child: child,
      appBar: AppBar(
        title: Text('AppBar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: refresh,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return makeBody();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          newRequestTicket();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }

  void refresh() {}
  void viewDetail() {
     Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => StarDisplayWidget()));
  }
  void newRequestTicket() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CaseInformation()));
  }
}
