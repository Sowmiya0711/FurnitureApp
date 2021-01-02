import 'package:flutter/material.dart';
import 'package:furnitureApp/extensions/colors.dart';
import 'package:furnitureApp/size_config.dart';

class OrderCompletionBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Text("Thank you!",
          style: TextStyle(fontSize: 35,
          color: Colors.grey,
          fontWeight: FontWeight.bold),),
          SizedBox(height: 30),
          Container(
            height: 125,
            width: 125,
            child: Image.asset('assets/icons/package.png')),
            SizedBox(height: 30),
            Text("Your Order has been placed",
            style: TextStyle(color: Colors.grey,
            fontSize: 20,
            ),),
            SizedBox(height: 30),
            Container(
              height: SizeConfig.screenHeight * 0.07,
              child: FlatButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color:  HexColor.fromHex('#D9C9BD'),

                child: Text("Continue Shopping",style: TextStyle(
                  color: Colors.white,
                fontSize: 18),),
                onPressed: () => Navigator.popUntil(context, 
              (route) => route.isFirst)),
            ),
        ],
      ),
    );
  }
}