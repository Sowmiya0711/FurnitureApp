import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/notifiers/product_list_notifier.dart';


class DatabaseService {
  final String uid;

  DatabaseService({@required this.uid}) : assert(uid != null);

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String userName, int phoneNumber) async {
  
    return await userCollection.doc(uid).set({
        'displayName': userName,
        'phoneNumber': phoneNumber
    });
  }
}

  getCarouselViewData(ProductListNotifier productListNotifier) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("productList").get();

    List<CarouselView> _carouselViewList = [];

    snapshot.docs.forEach((document) {
      CarouselView carouselView = CarouselView.fromMap(document.data());
      _carouselViewList.add(carouselView);
      print("CarouselView ${_carouselViewList[0].carouselViewImages.length}");
    }
    );

    productListNotifier.carouselView = _carouselViewList;
  }
