import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:semart_tech/helpers/global.dart';
import 'package:semart_tech/models/listCategory.dart';
import 'package:http/http.dart' as http;

//void main() => runApp(CategoryParent());

class CategoryParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<DataCategory> _notes = List<DataCategory>();
  List<DataCategory> _notesForDisplay = List<DataCategory>();
  String token = appData.token;

  Future<List<DataCategory>> fetchNotes() async {
    var url = 'https://cs.agungsedayu.com/apitesting/ST/GetSimpcat?token='+token+'&idparent=';//'https://raw.githubusercontent.com/boriszv/json/master/random_example.json';
    var response = await http.get(url);
    
    var notes = List<DataCategory>();
    
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(DataCategory.fromJson(noteJson));
      }
    }
    return notes;
  }

getCategory(){
  
}

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter listview with json'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index-1);
        },
        itemCount: _notesForDisplay.length+1,
      )
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.description.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _notesForDisplay[index].description,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              _notesForDisplay[index].idx,
              style: TextStyle(
                color: Colors.grey.shade600
              ),
            ),
          ],
        ),
      ),
    );
  }
}