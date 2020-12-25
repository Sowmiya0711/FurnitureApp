
import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/product_list/components/app_drawer.dart';
import 'package:furnitureApp/Screens/product_list/components/product_list_body.dart';
import 'package:furnitureApp/models/user.dart';
import 'package:furnitureApp/notifiers/product_list_notifier.dart';
import 'package:furnitureApp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:furnitureApp/services/database.dart';

class ProductList extends StatefulWidget {
  static String routeName = '/productList';

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  
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
   final user = Provider.of<UserModel>(context,listen: false);
  
   return Scaffold(
     body: ProductListBody(),
       drawer: AppDrawer(),
   );
  }

    
} 
