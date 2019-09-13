import 'package:flutter/material.dart';

import 'package:semart_tech/services/repository.dart';
import 'package:semart_tech/screens/applicationMenu.dart';

class Login extends StatefulWidget {
  final user='';
  final pass='';

  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String userName, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // left: true,
      // top: true,
      // right: true,
      // bottom: true,
      // minimum: const EdgeInsets.all(16.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  textFieldUserName(),
                  textFieldPassword(),
                  buttonLogin(),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget textFieldUserName() {
    return TextFormField(
      onSaved: (String value) {
        userName = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'User Name Could not be Empty!';
        }
        return null;
      },
      decoration: InputDecoration(hintText: 'User Name'),
    );
  }

  Widget textFieldPassword() {
    return TextFormField(
      onSaved: (String value) {
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Password Could not be Empty!';
        }
        return null;
      },
      decoration: InputDecoration(hintText: 'Password'),
      obscureText: true,
    );
  }

  Widget buttonLogin() {
    return RaisedButton(
      onPressed: () async {
        try {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            await Repository().doLogin(userName,password);
            
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Menu()));
          }
        } catch (ex) {
          debugPrint(ex.toString());
          AlertDialog(
            content: Text('Login Failed!' + ex.toString()),
          );
        }
        print('User Name= $userName');
        print('Password= $password');
      },
      child: Text(
        "Login",
      ),
      color: Colors.blue[600],
      textColor: Colors.white,
    );
  }
}
