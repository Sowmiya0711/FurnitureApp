import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final int starRating;
  final List<Map<String,dynamic>> colors;
  double cartPrice;
  bool isFavorite;

  Product(
    {
      @required this.id, 
      @required this.title, 
      @required this.description, 
      @required this.price, 
      @required this.imageUrl,
      @required this.starRating,
      this.colors,
      this.cartPrice,
      this.isFavorite = false
      });
}