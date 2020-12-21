import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';

class Signup extends StatelessWidget {
  final Function toggleView;
  Signup({this.toggleView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Sign up"),
        actions: <Widget>[
          FlatButton.icon(
          onPressed: () {toggleView();}, 
          icon: Icon(Icons.login), 
          label: Text("Sign in"))
        ]
      ),);
  }
}