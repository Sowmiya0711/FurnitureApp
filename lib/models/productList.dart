import 'package:flutter/material.dart';

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