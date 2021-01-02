import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/cart_screen/components/cart_body.dart';
import 'package:furnitureApp/extensions/colors.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cartScreen';
   

  @override
  Widget build(BuildContext context) {
    final cartList = ModalRoute.of(context).settings.arguments as List<Product>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text("My Bag", style: TextStyle(color: HexColor.fromHex("#D9C9BC"),
        fontSize: 23),),
        leading: IconButton(icon: Icon(
          Icons.close,
          size: 30,
          color: HexColor.fromHex('#7E8B76')),
          onPressed: () => Navigator.pop(context),),),
        
      body: cartList.length == 0 ? Center(
        child: Container(child: 
        Text("No Items",
        style: TextStyle(fontSize: 25,
        color: Colors.grey,),)),
      ) : CartBody(cartList: cartList),
    );
  }
}

typedef void CartListCallback(List<Product> cartList);