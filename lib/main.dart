import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/wrapper.dart';
import 'package:furnitureApp/models/user.dart';
import 'package:furnitureApp/routes.dart';
import 'package:furnitureApp/services/auth.dart';
import 'package:furnitureApp/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute: Wrapper.routeName,
        routes: routes,
      ),
    );
  }

  
}