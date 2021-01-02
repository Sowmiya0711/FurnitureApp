import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/cart_screen/cart_screen.dart';
import 'package:furnitureApp/Screens/product_details/components/favourite_icon.dart';
import 'package:furnitureApp/Screens/product_details/components/product_price.dart';
import 'package:furnitureApp/Screens/product_details/components/rating_bar_indicator.dart';
import 'package:furnitureApp/extensions/colors.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';
import 'package:furnitureApp/Screens/product_details/components/color_size.dart';

import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override

  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    Product loadedProduct = Provider.of<ProductList>(
      context,
      listen: false,
    ).findById(productId);
    
    FutureOr onGoBack(dynamic value) {
      

      setState(() {loadedProduct = Provider.of<ProductList>(
      context,
      listen: false,
    ).findById(productId);});
    }

    return InheritedProductDetailsProvider(
            loadedProduct: loadedProduct,
            child: Container(
          color: Colors.white,
          child: SafeArea(
            
                child: Scaffold(
              body: SingleChildScrollView(
                          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Container(height: getProportionateScreenHeight(400),
             padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
         color: HexColor.fromHex('#F1F2F6'),
        borderRadius: BorderRadius.circular(30),
        
        ),
                    child: Stack(
                      alignment: Alignment.topRight,
                      
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                                child: Hero(
                              tag: loadedProduct.id.toString(),
                              child: Image.network(loadedProduct.imageUrl,
                                            fit: BoxFit.fill)
                            ),
                        ),
                         Padding(
                           padding: const EdgeInsets.only(right: 8.0),
                           child: IconButton(icon: Icon(Icons.close, 
                           size: 40,
                           color: HexColor.fromHex('#7E8B76')), 
                        onPressed: () {Navigator.pop(context);}
                        ),
                         ),
                      ],
                    ),
                  ),
                      SizedBox(height: 7),
                      FavouriteIcon(),
                      
                      SizedBox(height: 7),
                      RatingBarIndicators(),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 10.0),
                        child: Text(loadedProduct.description,
                        style: TextStyle(color: Colors.blueGrey),),
                      ),
                      SizedBox(height: 5),
                      ColorAndSize(),
                      SizedBox(height: 5),
                      ProductPrice(loadedProduct: loadedProduct,isToLoadProduct: true),
                      
                      SizedBox(height: 5),
                      
                      Row(
                        children: [
                          Spacer(),
                          RaisedButton(onPressed: () {
                          Provider.of<ProductList>(context, listen: false).addCartProduct(loadedProduct);
                         
                          Navigator.of(context).
              pushNamed(CartScreen.routeName,
              arguments: Provider.of<ProductList>(context, listen: false).cartList).then(onGoBack);
              }, 
                          
                          child: Text("Buy Now",
                          style: TextStyle(color: Colors.white)),
                          color: Colors.black,),
                        ],
                      ),
                  ],
                ),
              ),
                ),
          ),
        ),
      );
    
  }
}