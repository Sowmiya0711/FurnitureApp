import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/authenticate/authenticate.dart';
import 'package:furnitureApp/Screens/product_list/product_list.dart';
import 'package:furnitureApp/models/user.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
   static String routeName = "/homePage";
  bool mounted = true;

  @override
  Widget build(BuildContext context) {
     if(mounted) {
      SizeConfig().init(context);
      mounted = false;
   }
    final user = Provider.of<UserModel>(context);
    print(user);
    // return either the Home or Authenticate widget
    if(user == null) {
      return Authenticate();
    } else {
      return ProductList();
    }
    
  }
}