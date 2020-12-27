import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';

class RatingBarIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: 
                     RatingBarIndicator(
                       itemBuilder: (context, index) => Icon(
                       Icons.star,
                        color: Colors.amber,
                      ),
                        itemCount: 5,
                        itemSize: 25.0,
                        rating: (InheritedProductDetailsProvider.of(context).loadedProduct.starRating).toDouble(),
                      ),

                  );
  }
}