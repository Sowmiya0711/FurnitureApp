
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnitureApp/Screens/cart_screen/cart_screen.dart';
import 'package:furnitureApp/Screens/order_completion/order_completion.dart';
import 'package:furnitureApp/Screens/product_details/product_details.dart';
import './Screens/wrapper.dart';
import 'package:furnitureApp/Screens/product_list/product_list.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => Wrapper(),
  ProductListScreen.routeName: (context) => ProductListScreen(),
  ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  OrderCompletion.routeName: (context) => OrderCompletion(),
};