import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';
import 'package:furnitureApp/Screens/sign_up/components/signup_body.dart';


class Signup extends StatelessWidget {
  final Function toggleView;
  Signup({this.toggleView});
  
  @override
  Widget build(BuildContext context) {
    return InheritedSigninProvider(
      toggleView: toggleView,
          child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text("Sign up",
          style: TextStyle(color: Colors.grey,)),
         
          leading: IconButton(onPressed: () => toggleView(),
          icon: Icon(Icons.close_sharp,size: 40),
          ),
        ),
        body: SignupBody(),
        ),
    );
  }
}