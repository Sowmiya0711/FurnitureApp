import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/product_list/components/product_item.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductList>(context);
    
    final products = productsData.items;


    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem()
        ),
      );
  }
}