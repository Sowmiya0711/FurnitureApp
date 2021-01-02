import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/product_details/product_details.dart';
import 'package:furnitureApp/extensions/colors.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:provider/provider.dart';

class BestSellerBody extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     final product = Provider.of<Product>(context);
    return Padding(
                  padding: EdgeInsets.only(right: getProportionateScreenWidth(15),left: getProportionateScreenWidth(3)),
                  child: SizedBox( 
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight * 0.17,
                  child: 
                  GestureDetector(
                onTap: () => Navigator.of(context).
                pushNamed(ProductDetailsScreen.routeName,
                arguments: product.id),
                child: Card(
                                  child: Row(
                    
                      children: <Widget>[
                        Container(
                           
                          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                          
                          child: Hero(
                            tag: product.id.toString() + product.id.toString(),
                            child: Image.network(product.imageUrl,
                            fit: BoxFit.fill,height: 250,width: 85,),
                          ),
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title,style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold),),
                          Text((product.price).toString(),
                      style: TextStyle(color: Colors.grey,
                      fontSize: 14),),
                        ],
                      ),
                      
                      ]
                    ),
                )
                  ),
            ),
        );
  }
}