import 'package:flutter/material.dart';
import 'package:furnitureApp/extensions/colors.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductList>(context);
    final products = productsData.items;
    final double width = 160;
    final double aspectRatio = 0.95;

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(10),
          
          child: Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(15),left: getProportionateScreenWidth(3)),
            child: SizedBox( 
            width: getProportionateScreenWidth(width),
            child: 
            GestureDetector(
          onTap: () => print("navigate"),
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
                    tag: products[i].id.toString(),
                    child: Image.network(products[i].imageUrl,
                    fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(products[i].title,style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold),),
              Text((products[i].price).toString(),
              style: TextStyle(color: Colors.grey,
              fontSize: 14),),
            ],
          ),
          ),)),
          ),
        ),
      );
  }
}