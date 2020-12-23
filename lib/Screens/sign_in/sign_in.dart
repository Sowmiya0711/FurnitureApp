import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/components/body.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';

class SignIn extends StatefulWidget {
 
  final Function toggleView;
  SignIn({ this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {

    return InheritedSigninProvider(
        toggleView: widget.toggleView,
         child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login",
          style: TextStyle(color: Colors.grey)),
          
        ),
        body: Body(),
      ),
    );
  }
}