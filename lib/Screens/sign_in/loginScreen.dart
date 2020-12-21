import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/components/body.dart';
import 'package:furnitureApp/size_config.dart';

class LoginScreen extends StatelessWidget {
 static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Body(),
    );
  }
}