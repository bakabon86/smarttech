import 'package:flutter/material.dart';
import 'package:semart_tech/helpers/global.dart';
//import 'package:semart_tech/screens/applicationMenu.dart';
import 'package:semart_tech/screens/attachment.dart';
//import 'package:semart_tech/services/repository.dart';

class Comment extends StatefulWidget {
  CommentState createState() => CommentState();
}

class CommentState extends State<Comment> {
  final _formKey = GlobalKey<FormState>();
  String desc;
  String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comment'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: commentBody(),
        ),
      ),
    );
  }

  Widget commentBody() {
    return Column(
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
        new RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Submit"),
          onPressed: sendComment,
        ),
      ],
    );
  }

  void sendComment() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //  token: token;
      //  number: number;
      appData.user= 'customer';
      //  time: time;
      //   kind: kind;
      desc = comment;
      //await Repository().sendComment(token, number, user, time, kind, desc);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) => Attachment()));
    }
  }
}
