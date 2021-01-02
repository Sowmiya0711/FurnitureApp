import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/product_list/components/best_seller_body.dart';

import 'package:furnitureApp/models/productList.dart';
import 'package:provider/provider.dart';


class BestSeller extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductList>(context);
    
    final products = productsData.items;
    

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: BestSellerBody(),
        ),
      );
  }
}