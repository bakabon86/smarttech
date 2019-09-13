//import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:dropdownfield/dropdownfield.dart';

import 'package:image_picker/image_picker.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:semart_tech/components/categoryParent.dart';

import 'package:semart_tech/helpers/global.dart';
import 'package:semart_tech/models/listCategory.dart';
import 'package:semart_tech/screens/comment.dart';
//import 'package:semart_tech/models/pomMasterDataModel.dart';
import 'package:semart_tech/services/repository.dart';

class CaseInformation extends StatefulWidget {
  CaseInfoState createState() => CaseInfoState();
}

class CaseInfoState extends State<CaseInformation> {
  final _formKey = GlobalKey<FormState>();
  String pom,
      category,
      location,
      priority,
      units,
      sla,
      dueDate,
      description,
      comment;
  String cust, idcat, unit, loc, desc, number, user, kind;
  File url;
  DateTime time;
  List<String> lsDropDownPOM = ['POM', 'one', 'two', 'three'];
  List<String> lsDropDownCategory = ['Category', 'one', 'two', 'three'];
  String selectedValuedPOM,
      selectedValuedCategory1,
      selectedValuedCategory2,
      selectedValuedCategory3;
  Map<String, dynamic> formData;

  List lsDDLPOM = List();
  List lsDDLCategory = List();
  List lsDDLCategory2 = new List();
  List lsDDLCategory3 = List();
  List<String> lsDDLCat = List();
  String token = appData.token;
  File _image;
  //StreamController<List<DataCategory>> _events;

  CaseInfoState() {
    formData = {
      'idx': '',
      'description': '',
    };
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImageFromGalerry() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
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
    //_events = new StreamController<List<DataCategory>>();
  }

  getPOM() async {
    lsDDLPOM = await Repository().getPOMListName();
    getCategoryParent('');
  }

  getCategoryParent(String idParent) async {
    lsDDLCategory = await Repository().getCategory(idParent);
    //lsDDLCat = lsDDLCategory.cast<String>().toList();
  }

  getCategoryChild(String idParent) async {
    return await Repository().getCategory(idParent);
    //lsDDLCat = lsDDLCategory.cast<String>().toList();
  }

  getCustomer() async {
    return await Repository().getCust();
  }

  void _onSelectedPom(String value) {
    setState(() => selectedValuedPOM = value);
    pom = value;
  }

  void _onSelectedCategoryParent1(String value) {
    setState(() {
      selectedValuedCategory1 = value;
      selectedValuedCategory2 = null;
      selectedValuedCategory3 = null;
      //lsDDLCategory2.clear();
      //lsDDLCategory2 = getCategoryChild(value);
    });
    //selectedValuedCategory2= '';
    //lsDDLCategory2=[''];
    //lsDDLCategory2 = getCategoryChild(value);
    //createDDLCategory(value);
    //});
    idcat = value;
    //createDDLCategory(value);
    //_events = getCategoryChild(value);
  }

  void _onSelectedCategoryParent2(String value) {
    setState(() //=> selectedValuedCategory2 = value);
        {
      selectedValuedCategory2 = value;
      selectedValuedCategory3 = null;
      //  lsDDLCategory3.clear();
      //lsDDLCategory3 = getCategoryChild(value);
    });
    idcat = value;
    //_events = getCategoryChild(value);
  }

  void _onSelectedCategoryParent3(String value) {
    setState(() => selectedValuedCategory3 = value);
    idcat = value;
    //getCategoryParent(value);
  }

  Widget createDDLCategory(String vlue) {
    return FutureBuilder<List<DataCategory>>(
        future: Repository().getCategory(vlue),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              //lsDDLCategory2.clear();
              return new DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  items: snapshot.data?.map((item) {
                        return new DropdownMenuItem<String>(
                          child: new Text(item.description),
                          value: item.idx.toString(),
                        );
                      })?.toList() ??
                      [],
                  onChanged: (value) => _onSelectedCategoryParent2(value),
                  value: selectedValuedCategory2);
            } else {
              return Text('A');
            }
          } else {
            return Text('B');
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Case Information')),
        body: Form(
          key: _formKey,
          child: ListView(
            children: getFormWidget(),
          ),
          //   Column(
          // children: <Widget>[

          //       new DropdownButton<String>(
          //         isExpanded: true,
          //         isDense: true,
          //         items: lsDDLPOM.map((item) {
          //           return new DropdownMenuItem<String>(
          //             child: new Text(item.name),
          //             value: item.name.toString(),
          //           );
          //         }).toList(),
          //         // onChanged: (newVal) {
          //         //   setState(() {
          //         //     selectedValuedPOM= newVal;
          //         //   });
          //         // },
          //         onChanged: (value) => _onSelectedPom(value),
          //         value: selectedValuedPOM != null ? selectedValuedPOM:'Ancol Mansion',
          //       ),

          //       new TextFormField(
          //         onSaved: (String value) {
          //           loc = value;
          //         },
          //         decoration: InputDecoration(hintText: 'Lokasi'),
          //       )
          //  ],
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'POM',
              style: TextStyle(color: Colors.green, fontSize: 11),
            ),
          ),
          Expanded(
              flex: 3,
              child: new DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  items: lsDDLPOM.map((item) {
                    return new DropdownMenuItem<String>(
                      child: new Text(item.name),
                      value: item.code.toString(),
                    );
                  }).toList(),
                  onChanged: (value) => _onSelectedPom(value),
                  value: selectedValuedPOM))
        ],
      ),
    ));

    // formWidget.add(
    //   new DropDownField(
    //       value: formData['Category'],
    //       //icon: Icon(Icons.location_city),
    //       required: true,
    //       hintText: 'Choose a category',
    //       labelText: 'Category *',
    //       items: lsDDLCat,
    //       strict: false,
    //       setter: (dynamic newValue) {
    //         formData['Category'] = newValue;
    //       }),
    // );
    //parent Category
    //lsDDLCategory != []
    //    ?
    formWidget.add(Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'Jenis',
              style: TextStyle(color: Colors.green, fontSize: 11),
            ),
          ),
          Expanded(
              flex: 3,
              child: new DropdownButton<String>(
                  isExpanded: true,
                  isDense: true,
                  hint: Text('Pilih Jenis'),
                  disabledHint: Text('=='),
                  items: lsDDLCategory.map((item) {
                    return new DropdownMenuItem<String>(
                      child: new Text(item.description),
                      value: item.idx.toString(),
                    );
                  }).toList(),
                  onChanged: (value) => _onSelectedCategoryParent1(value),
                  value: selectedValuedCategory1)),
        ],
      ),
    ));
    //  : Text('');

    // formWidget.add(
    //   MyDropdown(values: selectedValuedCategory1,),
    // );
    // selectedValuedCategory2 = MyDropdownState().selectedValue.toString();

    // //2nd Category
    //lsDDLCategory2.isEmpty
    //  ? Container()
    // :
    formWidget.add(Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'Category',
              style: TextStyle(color: Colors.green, fontSize: 11),
            ),
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder<List<DataCategory>>(
                future: Repository().getCategory(selectedValuedCategory1),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      //lsDDLCategory2.clear();
                      return new DropdownButton<String>(
                          isExpanded: true,
                          isDense: true,
                          hint: Text('Pilih Category'),
                          disabledHint: Text('=='),
                          items: snapshot.data.map((item) {
                                return new DropdownMenuItem<String>(
                                  child: new Text(item.description),
                                  value: item.idx.toString(),
                                );
                              })?.toList() ??
                              [],
                          onChanged: (value) =>
                              _onSelectedCategoryParent2(value),
                          value: selectedValuedCategory2);
                    } else {
                      return Text('A');
                    }
                  } else {
                    return Text('B');
                  }
                }),
          )
        ],
      ),
    ));
    // lsDDLCategory2.isEmpty
    //   ? Container()
    //   :
    // formWidget.add(Container(
    //   height: 100,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Expanded(
    //         flex: 1,
    //         child: Text(
    //           'Category',
    //           style: TextStyle(color: Colors.green, fontSize: 11),
    //         ),
    //       ),
    //       Expanded(
    //           flex: 3,
    //           child: new DropdownButton<String>(
    //               isExpanded: true,
    //               isDense: true,
    //               hint: Text('Pilih Category'),
    //               disabledHint: Text('=='),
    //               items: lsDDLCategory2.map((item) {
    //                     return new DropdownMenuItem<String>(
    //                       child: new Text(item.description),
    //                       value: item.idx.toString(),
    //                     );
    //                   })?.toList() ??
    //                   [],
    //               onChanged: (value) => _onSelectedCategoryParent2(value),
    //               value: selectedValuedCategory2)),
    //     ],
    //   ),
    // ));

    //3rd category
    // lsDDLCategory3.isEmpty
    //     ?Container()
    // :
    // formWidget.add(Container(
    //   height: 100,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Expanded(
    //         flex: 1,
    //         child: Text(
    //           'Sub Category',
    //           style: TextStyle(color: Colors.green, fontSize: 11),
    //         ),
    //       ),
    //       Expanded(
    //         flex: 3,
    //         child: StreamBuilder<List<DataCategory>>(
    //             initialData: lsDDLCategory,
    //             stream: _events.stream,
    //             builder: (context, snapshot) {
    //               return new DropdownButton<String>(
    //                   isExpanded: true,
    //                   isDense: true,
    //                   items: snapshot.data?.map((item) {
    //                         return new DropdownMenuItem<String>(
    //                           child: new Text(item.description),
    //                           value: item.idx.toString(),
    //                         );
    //                       })?.toList() ??
    //                       [],
    //                   onChanged: (value) => _onSelectedCategoryParent3(value),
    //                   value: selectedValuedCategory3);
    //             }),
    //       )
    //     ],
    //   ),
    // ));

    // formWidget.add(
    //   MyDropdown(values: selectedValuedCategory2,),
    // );
    // selectedValuedCategory3 = MyDropdownState().selectedValue.toString();

    // //3rd Category
    formWidget.add(Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'Sub Category',
              style: TextStyle(color: Colors.green, fontSize: 11),
            ),
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder<List<DataCategory>>(
                future: Repository().getCategory(selectedValuedCategory2),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      //lsDDLCategory2.clear();
                      return new DropdownButton<String>(
                          isExpanded: true,
                          isDense: true,
                          hint: Text('Pilih Sub Category'),
                          disabledHint: Text('=='),
                          items: snapshot.data.map((item) {
                                return new DropdownMenuItem<String>(
                                  child: new Text(item.description),
                                  value: item.idx.toString(),
                                );
                              })?.toList() ??
                              [],
                          onChanged: (value) =>
                              _onSelectedCategoryParent3(value),
                          value: selectedValuedCategory3);
                    } else {
                      return Text('A');
                    }
                  } else {
                    return Text('B');
                  }
                }),
          )
        ],
      ),
    ));

    //Button Search List
    // formWidget.add(new RaisedButton(
    //   child: Text('Pilih Category'),
    //   onPressed: ambilCategory,
    // ));

    formWidget.add(
      new TextFormField(
        initialValue: units,
        onSaved: (String value) {
          units = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please insert unit';
          }
          return null;
        },
        decoration: InputDecoration(labelText: 'Units', hintText: 'Units'),
      ),
    );

    formWidget.add(
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
    );

    formWidget.add(
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
    );

    formWidget.add(Container(
      height: 100,
      child: Column(
        children: <Widget>[
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image),
          ),
          FloatingActionButton(
            onPressed: getImageFromCamera,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
        ],
      ),
    ));

    // formWidget.add(
    //   Container(
    //     height: 200,
    //     child: Column(
    //       children: <Widget>[
    //         GridViewImages()
    //       ],
    //     ),
    //   )
    // );

    formWidget.add(Column(
      children: <Widget>[
        new TextFormField(
          initialValue: comment,
          onSaved: (String value) {
            comment = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please insert comment';
            }
            return null;
          },
          decoration:
              InputDecoration(labelText: 'Comment', hintText: 'Comment'),
        ),
      ],
    ));
    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Submit'),
        onPressed: onPressedSubmit));
    return formWidget;
  }

  void ambilCategory() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => CategoryParent()));
  }

  void onPressedSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //Send New Ticket
      token = appData.token != null ? appData.token : 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsib2F1dGgyLXJlc291cmNlIiwiYzEtc2VydmVyIl0sInVzZXJfbmFtZSI6Ijg1NjE1NTUzOTMiLCJzY29wZSI6WyJyb2xlX2FkbWluIl0sImV4cCI6MTU2ODY3MTM2MSwiYXV0aG9yaXRpZXMiOlsiQzFfQ1VTVE9NRVIiXSwianRpIjoiNjliOWExYzktMmUzNy00MjQxLWFiMWEtNDQ0MzQ2MjM5YzgyIiwiY2xpZW50X2lkIjoic21hcnR0ZWNoLWRldiJ9.YPGoJJ6_NFJ7vJ93wRYrwlOwdd6xKLj7DJvI7m8ssGJGikV4SSp6Idm5s57SjcGXGb7z4ZGYUSFuFmJ-XOuK3_WOsk2PsUyfL1FUpiFfMqPMsJ9QHdiXbIEebNyBteR5Z_T9K5wkGp32ZPOYOxs8kWL_TMHhQeOY3XrZT7Krb_3kCFk5P9To7DBxHFmK_KusaRrn9Cp7WeVjcZm063H14LrLhwWbn4VX8CDnZSFndcBYodYevdIb_EFJjx7_k1dNOD9mocU63tHj6XfPqcxWLUzHvaGUgHJ2PW-jAA6swSCXvkqn3lZ5b6lSmwICLCG1kkgLMDogxfTgIpgJ54Lw3A';
      loc = location;
      desc = description;
      pom = appData.pom != null ? appData.pom : pom;
      appData.idcat = idcat;
      unit = appData.unit != null ? appData.unit : units;
      appData.loc = loc;
      appData.desc = desc;
      number = (await Repository().sendNewTicket(token, pom, idcat, unit, loc, desc)) as String;
      //Send Comment
      user = 'customer';
      appData.user = 'customer';
      time= TimeOfDay.now() as DateTime;
      kind= 'P';
      desc = comment;
      await Repository().sendComment(token, number, user, time, kind, desc);
      //Send Attachment
      user = 'customer';
      appData.user = 'customer';
      time = TimeOfDay.now() as DateTime;
      kind='P';
      url = _image;
      await Repository().sendAttachment(token, number, user, time, kind, url);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => Comment()));
    }
  }
}

class MyDropdown extends StatefulWidget {
  final values;
  MyDropdown({
    Key key,
    this.values,
  }) : super(key: key);
  MyDropdownState createState() => MyDropdownState();
}

class MyDropdownState extends State<MyDropdown> {
  String selectedValue;

  _onSelectedValue(value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'Category',
              style: TextStyle(color: Colors.green, fontSize: 11),
            ),
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder<List<DataCategory>>(
                future: Repository().getCategory(widget.values),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return new DropdownButton<String>(
                          isExpanded: true,
                          isDense: true,
                          hint: Text('Pilih Category'),
                          disabledHint: Text('=='),
                          items: snapshot.data.map((item) {
                                return new DropdownMenuItem<String>(
                                  child: new Text(item.description),
                                  value: item.idx.toString(),
                                );
                              })?.toList() ??
                              [],
                          onChanged: (value) => _onSelectedValue(value),
                          value: selectedValue);
                    } else {
                      return Text('A');
                    }
                  } else {
                    return Text('B');
                  }
                }),
          )
        ],
      ),
    );
  }
}
