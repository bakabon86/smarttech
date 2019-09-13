import 'package:flutter/material.dart';

class CustomerInfo extends StatefulWidget {
  CustomerInfoState createState() => CustomerInfoState();
}

class CustomerInfoState extends State<CustomerInfo> {
  final _formKey = GlobalKey<FormState>();
  String name,
      idNumber,
      address,
      city,
      postalCode,
      phone,
      mobile,
      email,
      socmed,
      personality,
      emotion,
      category,
      location,
      priority,
      remarks,
      sla,
      dueDate,
      description;
  String sex = 'single';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Customer Info')),
        body: Form(
            key: _formKey,
            child: new ListView(
              children: getFormWidget(),
            )));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();
    formWidget.add(
      new TextFormField(
        initialValue: name,
        onSaved: (String value) {
          name = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please insert name field';
          }
          return null;
        },
        decoration: InputDecoration(labelText: 'Name', hintText: 'Name'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          idNumber = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter ID number!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'ID Number'),
      ),
    );
    formWidget.add(new Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('Single'),
          value: 'single',
          groupValue: sex,
          onChanged: (value) {
            setState(() {
              sex = value;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Married'),
          value: 'married',
          groupValue: sex,
          onChanged: (value) {
            setState(() {
              sex = value;
            });
          },
        ),
      ],
    ));

    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          address = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter address!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Address'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          city = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter city!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'City'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          postalCode = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter postal code!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Postal Code'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          phone = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter phone!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Phone'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          mobile = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter mobile!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Mobile'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          email = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter email!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Email'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          socmed = value;
        },
        // validator: (value) {
        //   if (value.isEmpty) {
        //     return 'Please enter email!';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(hintText: 'Email'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          personality = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter personality!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Personality'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          emotion = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter emotion!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Emotion'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          category = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter category!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Category'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          location = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter location!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Location'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          priority = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter priority!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Priority'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          remarks = value;
        },
        // validator: (value) {
        //   if (value.isEmpty) {
        //     return 'Please enter postal code!';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(hintText: 'Remarks'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          sla = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter SLA!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'SLA'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          dueDate = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter due date!';
          }
          return null;
        },
        decoration: InputDecoration(hintText: 'Due Date'),
      ),
    );
    formWidget.add(
      new TextFormField(
        onSaved: (String value) {
          description = value;
        },
        // validator: (value) {
        //   if (value.isEmpty) {
        //     return 'Please enter postal code!';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(hintText: 'Description'),
      ),
    );
    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Sign Up'),
        onPressed: onPressedSubmit));
    return formWidget;
  }

  void onPressedSubmit() {}
}
