
import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/product_list/components/app_drawer.dart';
import 'package:furnitureApp/Screens/product_list/components/product_list_body.dart';

import 'package:furnitureApp/notifiers/product_list_notifier.dart';
import 'package:furnitureApp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:furnitureApp/services/database.dart';

class ProductListScreen extends StatefulWidget {
  static String routeName = '/productList';

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  
  final AuthService _auth = AuthService();
 
  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_){
    ProductListNotifier productListNotifier = Provider.of<ProductListNotifier>(context,listen: false);
    getCarouselViewData(productListNotifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ProductListBody(),
     drawer: AppDrawer(),
   );
  }

    
} 
