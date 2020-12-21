import 'package:flutter/material.dart';
import 'package:furnitureApp/homePage.dart';
import 'package:furnitureApp/Screens/sign_in/loginScreen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => HomePage(),
  LoginScreen.routeName: (context) => LoginScreen(),

};