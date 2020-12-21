import 'package:flutter/material.dart';
import 'package:furnitureApp/services/auth.dart';

class ProductList extends StatefulWidget {
  static String routeName = '/productList';

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  
  final AuthService _auth = AuthService();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue,
        elevation: 0.0,
        title: Text("Product List"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("logout"),
            onPressed: () async{
              await _auth.signOut();
            })
        ]
    )
    );
  }
}