import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:provider/provider.dart';

class FavouriteIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(InheritedProductDetailsProvider.of(context).loadedProduct.title,
                        style: TextStyle(
                        fontSize: 23),),
                      ),
                     
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                    icon: Icon(
                      InheritedProductDetailsProvider.of(context).loadedProduct.isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 35,
                    ),
                   
                    onPressed: () {
                    Provider.of<ProductList>(context, listen: false).toggleFavourite(InheritedProductDetailsProvider.of(context).loadedProduct);
                    
                    },
                  ),
                      ),
            
                      
                     ],
                  );
  }
}