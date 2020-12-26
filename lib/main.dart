import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/wrapper.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/models/user.dart';
import 'package:furnitureApp/notifiers/product_list_notifier.dart';
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
  
    return MultiProvider(
      providers: [
        StreamProvider<UserModel>.value(
       value: AuthService().user,
        ),
        ChangeNotifierProvider(
          create: (context) => ProductListNotifier(),
          ),
        ChangeNotifierProvider.value(
          value: ProductList(),
        ),
        
      ],
             child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme(),
          initialRoute: Wrapper.routeName,
          routes: routes,
        ),
      );
    
  }

  
}