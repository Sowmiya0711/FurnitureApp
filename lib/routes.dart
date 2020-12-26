
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furnitureApp/Screens/product_details/product_details.dart';
import './Screens/wrapper.dart';
import 'package:furnitureApp/Screens/product_list/product_list.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => Wrapper(),
  ProductList.routeName: (context) => ProductList(),
  ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
};