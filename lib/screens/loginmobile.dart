import 'package:flutter/material.dart';
import 'package:semart_tech/models/response.dart';
import 'package:semart_tech/services/repository.dart';
import 'package:semart_tech/screens/loginPinMobile.dart';


class LoginMobile extends StatefulWidget {
  _LoginMobileState createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final _formKey = GlobalKey<FormState>();

  String mobileNo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.person,
              size: 45,
            ),
            radius: 35,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: TextFormField(
                  onSaved: (String value) {
                    mobileNo = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter mobile number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixText: "+62 ",
                    hintText: "Enter mobile number",
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  CheckMobileNo result = await Repository().doCheck(mobileNo);
                  if (result.statusCode == 3){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginPinMobile(mobileNo: mobileNo)));
                  }
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
