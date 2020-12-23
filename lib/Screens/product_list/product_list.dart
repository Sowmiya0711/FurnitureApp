import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:furnitureApp/models/user.dart';
import 'package:furnitureApp/notifiers/product_list_notifier.dart';
import 'package:furnitureApp/services/auth.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:provider/provider.dart';
import 'package:furnitureApp/services/database.dart';

class ProductList extends StatefulWidget {
  static String routeName = '/productList';

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  
  final AuthService _auth = AuthService();
 

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_){
    ProductListNotifier productListNotifier = Provider.of<ProductListNotifier>(context,listen: false);
    getCarouselViewData(productListNotifier);
   
    });
  }

  @override
  Widget build(BuildContext context) {
   final user = Provider.of<UserModel>(context,listen: false);
   
   ProductListNotifier productListNotifier = Provider.of<ProductListNotifier>(context);
   
 Widget imageCarouselView = productListNotifier.carouselView.length == 0
  ? CircularProgressIndicator() : ListView(
    children: [
      CarouselSlider(
        
        options: CarouselOptions(
          height: getProportionateScreenHeight(SizeConfig.screenHeight * 0.3),
          //  enlargeCenterPage: true, 
         enableInfiniteScroll: false,
         viewportFraction: 1, 
         autoPlayCurve: Curves.fastOutSlowIn,
         ),
        items: productListNotifier.carouselView[0].carouselViewImages.map((img) {
          return Builder(
          
           builder: (context) {
              return Container(
                width: getProportionateScreenWidth(SizeConfig.screenWidth),
              
                child: CachedNetworkImage(imageUrl: img,
                imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fill,
          ),
    ),
  ),),
                
              );
            }
          );
        }).toList(),
),
    ],
  );
 

   return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue,
        elevation: 0.0,
        title: Text(user.userName),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("logout"),
            onPressed: () async{
              await _auth.signOut();
            })
        ]
    ),
    body: Center(
      child: Container(
         
        child: imageCarouselView,
          
      ),
    )
      
    );
  }  
} 
