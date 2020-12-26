import 'package:flutter/material.dart';
import 'package:furnitureApp/models/product.dart';

class InheritedSigninProvider extends InheritedWidget {
  const InheritedSigninProvider({Key key, Widget child, this.toggleView}) : super(key: key, child: child);
  final Function toggleView;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static InheritedSigninProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedSigninProvider>();
  }
}

class InheritedProductDetailsProvider extends InheritedWidget {
  const InheritedProductDetailsProvider({Key key, Widget child,this.loadedProduct}) : super(key: key,child: child);
  final Product loadedProduct;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
  
   static InheritedProductDetailsProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedProductDetailsProvider>();
  }
}