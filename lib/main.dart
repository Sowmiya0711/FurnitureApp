import 'package:flutter/material.dart';
import 'package:furnitureApp/homePage.dart';
import 'package:furnitureApp/routes.dart';
import 'package:furnitureApp/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }

  
}