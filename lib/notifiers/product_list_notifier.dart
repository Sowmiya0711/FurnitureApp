import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:furnitureApp/models/productList.dart';

class ProductListNotifier with ChangeNotifier {
  List<CarouselView> _carouselViewImages = [];

  UnmodifiableListView<CarouselView> get carouselView => UnmodifiableListView(_carouselViewImages);

  set carouselView(List<CarouselView> carouselView) {
    _carouselViewImages = carouselView;
    notifyListeners();
  }

}