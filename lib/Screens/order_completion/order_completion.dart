import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/order_completion/components/order_completion_body.dart';
import 'package:furnitureApp/extensions/colors.dart';

class OrderCompletion extends StatelessWidget {
 static String routeName = "/order";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,
      automaticallyImplyLeading: false,
      // leading:  IconButton(icon: Icon(
      //     Icons.close,
      //     size: 30,
      //     color: HexColor.fromHex('#7E8B76')),
      //     onPressed: () => Navigator.pop(context),),
      ),
      body: OrderCompletionBody() 
    );
  }
}