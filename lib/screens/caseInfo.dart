import 'package:flutter/material.dart';
//import 'package:dropdownfield/dropdownfield.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
//import 'package:semart_tech/models/pomMasterDataModel.dart';
import 'package:semart_tech/services/repository.dart';

class CaseInformation extends StatefulWidget {
  CaseInfoState createState() => CaseInfoState();
}

class CaseInfoState extends State<CaseInformation> {
  final _formKey = GlobalKey<FormState>();
  String pom, category, location, priority, remarks, sla, dueDate, description;
  String token, cust, idcat, unit, loc, desc;
  List<String> lsDropDownPOM = ['POM', 'one', 'two', 'three'];
  List<String> lsDropDownCategory = ['Category', 'one', 'two', 'three'];
  String selectedValuedPOM = 'Ancol Mansion', selectedValuedCategory;
  Map<String, dynamic> formData;
  List<String> cities = [
    'Bangalore',
    'Chennai',
    'New York',
    'Mumbai',
    'Delhi',
    'Tokyo',
  ];
  List<String> countries = [
    'INDIA',
    'USA',
    'JAPAN',
  ];
  List lsDDLPOM = List();

  CaseInfoState() {
    formData = {
      'City': 'Bangalore',
      'Country': 'INDIA',
    };
  }

  List<DropdownMenuItem> items = [];
  String selectedValue;
  Widget ddlSearch() {
    for (int i = 0; i < 20; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          'test ' + i.toString(),
        ),
        value: 'test ' + i.toString(),
      ));
    }

    return new SearchableDropdown(
      items: items,
      value: selectedValue,
      hint: new Text('Select One'),
      searchHint: new Text(
        'Select One',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getPOM();
  }

  getPOM() async {
    lsDDLPOM = await Repository().getPOMListName();
  }

  void _onSelectedPom(String value) {
    setState(() => selectedValuedPOM = value);
  }

  
  void onPressedSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await Repository()
          .sendNewTicket(token, pom,  idcat, unit, loc, desc);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => CaseInformation()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Case Information')),
        body: Form(
            key: _formKey,
            child: new ListView(
              children: <Widget>[
                
                Column(
                  children: <Widget>[
                    body(),
                    // new DropdownButton<String>(
                    //   isExpanded: true,
                    //   isDense: true,
                    //   items: lsDDLPOM.map((item) {
                    //     return new DropdownMenuItem<String>(
                    //       child: new Text(item.name),
                    //       value: item.name.toString(),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) => _onSelectedPom(value),
                    //   value: selectedValuedPOM != null
                    //       ? selectedValuedPOM
                    //       : 'Ancol Mansion',
                    // ),
                    // new TextFormField(
                    //   onSaved: (String value) {
                    //     loc = value;
                    //   },
                    //   decoration: InputDecoration(hintText: 'Lokasi'),
                    // )
                  ],
                )
              ],
            )));
  }

  Widget body(){
    return
    new Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('POM'),
              ],
            ),
            Column(
              children: <Widget>[
                Text(':'),
              ],
            ),
            new Column(
              children: <Widget>[
                 new DropdownButton<String>(
                      isExpanded: true,
                      isDense: true,
                      items: lsDDLPOM.map((item) {
                        return new DropdownMenuItem<String>(
                          child: new Text(item.name),
                          value: item.name.toString(),
                        );
                      }).toList(),
                      onChanged: (value) => _onSelectedPom(value),
                      value: selectedValuedPOM != null
                          ? selectedValuedPOM
                          : 'Ancol Mansion',
                    ),
              ],
            )
          ],
        ),
      Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Category'),
              ],
            ),
            Column(
              children: <Widget>[
                Text(':'),
              ],
            ),
            Column(
              children: <Widget>[
                DropdownButton(
                  value: selectedValuedCategory,
                  items: lsDropDownCategory
                      .map((x) => DropdownMenuItem(child: Text(x), value: x))
                      .toList(),
                  onChanged: (String value) {
                    setState(() {
                      selectedValuedCategory = value;
                    });
                  },
                ),              
              ],
            )
          ],
      ),
      Row(
        children: <Widget>[
          new TextFormField(
        initialValue: location,
        onSaved: (String value) {
          location = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please insert location';
          }
          return null;
        },
        decoration:
            InputDecoration(labelText: 'Location', hintText: 'Location'),
      ),
        ],
      ),
      Row(
        children: <Widget>[
            Column(
              children: <Widget>[
                Text('Priority'),
              ],
            ),
            Column(
              children: <Widget>[
                Text(':'),
              ],
            ),
            Column(
              children: <Widget>[
                DropdownButton(
                  value: selectedValuedCategory,
                  items: lsDropDownCategory
                      .map((x) => DropdownMenuItem(child: Text(x), value: x))
                      .toList(),
                  onChanged: (String value) {
                    setState(() {
                      selectedValuedCategory = value;
                    });
                  },
                ),              
              ],
            )
        ],
      ),
      Row(
        children: <Widget>[
          new TextFormField(
        initialValue: remarks,
        onSaved: (String value) {
          remarks = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please insert remarks';
          }
          return null;
        },
        decoration: InputDecoration(labelText: 'Remarks', hintText: 'Remarks'),
      ),
        ],),
        Row(
          children: <Widget>[
             new TextFormField(
        initialValue: sla,
        onSaved: (String value) {
          sla = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please insert SLA';
          }
          return null;
        },
        decoration: InputDecoration(labelText: 'SLA', hintText: 'SLA'),
      ),
          ],
        ),
        Row(
          children: <Widget>[
            new TextFormField(
        initialValue: dueDate,
        onSaved: (String value) {
          dueDate = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please insert Due Date';
          }
          return null;
        },
        decoration:
            InputDecoration(labelText: 'Due Date', hintText: 'Due Date'),
      ),
          ],
        ),
        Row(
          children: <Widget>[
             new TextFormField(
        initialValue: description,
        onSaved: (String value) {
          description = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please insert description';
          }
          return null;
        },
        decoration:
            InputDecoration(labelText: 'Description', hintText: 'Description'),
      ),
          ],
        ),
        Row(
          children: <Widget>[
            new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Submit'),
        onPressed: onPressedSubmit)
          ],
        ),
      ],
    );

  }
}
