import 'package:flutter/material.dart';
import 'package:furnitureApp/models/product.dart';

class CarouselView {
  List carouselViewImages = [];

  CarouselView();

  CarouselView.fromMap(Map<String,dynamic> data) {
    carouselViewImages = data['carouselViewImages'];
  }

  Map<String, dynamic> toMap() {
    return {
      'carouselViewImages': carouselViewImages,
    };
  }
}


class ProductList with ChangeNotifier {
  List<Product> _cartProducts = [];
  
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      starRating: 3,
      colors: [{"color": "0xF356C95","isSelected": true },{"color": "0xFFF8C078","isSelected": false},{"color": "0xFFA29B9B" ,"isSelected": false}]
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      starRating: 4,
     colors: [{"color": "0xF356C95","isSelected": true },{"color": "0xFFF8C078","isSelected": false},{"color": "0xFFA29B9B" ,"isSelected": false}]
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/furnitureapp-46601.appspot.com/o/lamp-CarouselView.jpeg?alt=media&token=6d2693c7-aa1c-4004-bb4c-83e1c946f84a',
      starRating: 5,
      colors: [{"color": "0xF356C95","isSelected": true },{"color": "0xFFF8C078","isSelected": false},{"color": "0xFFA29B9B" ,"isSelected": false}]
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
      starRating: 5,
      colors: [{"color": "0xF356C95","isSelected": true },{"color": "0xFFF8C078","isSelected": false},{"color": "0xFFA29B9B" ,"isSelected": false}]
    ),
  ];

  List<Product> get items {
    return[..._items];
  }

  List<Product> get cartList {
    return[..._cartProducts];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  toggleFavourite(Product item) {
    int index = _items.indexWhere((element) => element.id == item.id);
    _items[index].isFavorite = !_items[index].isFavorite;
    notifyListeners();
  }

  updatePrice(Product item,double price,int cartItemCount) {
    int index = _items.indexWhere((element) => element.id == item.id);
    _items[index].cartPrice = price.roundToDouble();
    _items[index].cartItemCount = cartItemCount;
    notifyListeners();
  }

  addCartProduct(Product cartItem) {
    if ((_cartProducts.singleWhere((it) => it.id == cartItem.id,
          orElse: () => null)) != null) {
    
    } else {
      _cartProducts.add(cartItem);
    }
    notifyListeners();
  }

  removeCartProduct() {
    _cartProducts.clear();
  }
}
