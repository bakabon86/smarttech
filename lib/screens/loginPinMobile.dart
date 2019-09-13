import 'package:flutter/material.dart';
import 'package:semart_tech/services/repository.dart';
import 'package:semart_tech/screens/caseInformation.dart';

class LoginPinMobile extends StatefulWidget {
  final mobileNo;
  LoginPinMobile({Key key, this.mobileNo}) : super(key: key);

  LoginPinMobileState createState() => LoginPinMobileState();
}

class LoginPinMobileState extends State<LoginPinMobile> {
  final _formKey = GlobalKey<FormState>();
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: TextFormField(
                  onSaved: (String value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter mobile number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter PIN",
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: RaisedButton(
              onPressed: () async {
                try {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await Repository().doLogin(widget.mobileNo, password);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => CaseInformation()));
                  }
                } catch (ex) {
                  debugPrint(ex.toString());
                }
              },
              child: Text(
                "Login",
              ),
              color: Colors.blue[600],
              textColor: Colors.white,
            ),
          )
        ],
      ),
    )));
  }
}
