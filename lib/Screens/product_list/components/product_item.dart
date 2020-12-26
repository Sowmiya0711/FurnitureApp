import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/product_details/product_details.dart';

import 'package:furnitureApp/extensions/colors.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     final product = Provider.of<Product>(context, listen: false);
    final double width = 160;
    final double aspectRatio = 0.95;

    return ClipRRect(
           borderRadius: BorderRadius.circular(10),
          
          child: Stack(
           alignment: Alignment.topRight,
            children: [
              
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(15),left: getProportionateScreenWidth(3)),
                child: SizedBox( 
                width: getProportionateScreenWidth(width),
                child: 
                GestureDetector(
              onTap: () => Navigator.of(context).
              pushNamed(ProductDetailsScreen.routeName,
              arguments: product.id),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
                  AspectRatio(
                    aspectRatio: aspectRatio,
                    child: Container(
                       
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      decoration: BoxDecoration(
    color: HexColor.fromHex('#F1F2F6'),
    
    boxShadow: [
      BoxShadow(
        color: Colors.blueGrey.withOpacity(0.05),
        spreadRadius: 0,
        blurRadius: 2,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],),
                      child: Hero(
                        tag: product.id.toString(),
                        child: Image.network(product.imageUrl,
                        fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Text(product.title,style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold),),
                  Text((product.price).toString(),
                  style: TextStyle(color: Colors.grey,
                  fontSize: 14),),
                ],
              ),
              ),)),
              Consumer<Product>(
            builder: (ctx, product, _) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                    icon: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                   
                    onPressed: () {
                      Provider.of<ProductList>(context, listen: false).toggleFavourite(product);
                    },
                  ),
            ),
          ),
            ],
          ),
          );
  }
}