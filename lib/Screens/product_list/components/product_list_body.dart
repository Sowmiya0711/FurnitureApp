import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:furnitureApp/Screens/cart_screen/cart_screen.dart';
import 'package:furnitureApp/Screens/product_list/components/products_list.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/notifiers/product_list_notifier.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:provider/provider.dart';
import 'package:furnitureApp/Screens/product_list/components/best_seller.dart';

class ProductListBody extends StatefulWidget {
  @override
  _ProductListBodyState createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody> {
  @override
  Widget build(BuildContext context) {
      
   ProductListNotifier productListNotifier = Provider.of<ProductListNotifier>(context);

  Widget imageCarouselView = productListNotifier.carouselView.length == 0
  ? CircularProgressIndicator() : ListView(
   children: [
      CarouselSlider(
        options: CarouselOptions(
          height: getProportionateScreenHeight(SizeConfig.screenHeight * 0.35),
          enlargeCenterPage: true, 
         enableInfiniteScroll: true,
         reverse: false,
         viewportFraction: 1, 
         autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
         autoPlayCurve: Curves.fastOutSlowIn,
         ),
        items: productListNotifier.carouselView[0].carouselViewImages.map((img) {
          return Builder(
           builder: (copntext) {
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


 return SingleChildScrollView(
    child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(
          height: getProportionateScreenHeight(SizeConfig.screenHeight * 0.35),
                child: Stack(
            fit: StackFit.loose,
                 children: <Widget>[
                   imageCarouselView,
                    SafeArea(
                  child: AppBar(
                    backgroundColor:  Colors.transparent,
                    elevation: 0.0,
                    actions: <Widget>[
                        IconButton(
                         
                          icon: Icon(Icons.card_travel,
                          size: 30,
                          color: Colors.black,),
                          onPressed: () => Navigator.of(context).
                pushNamed(CartScreen.routeName,
                arguments: Provider.of<ProductList>(context, listen: false).cartList),),
                        IconButton(
                          
                          icon: Icon(Icons.home,
                          size: 30,
                          color: Colors.black,),),
                    ]
              ),
                  ),
                 ],
                 
                 ),
         ),
               SizedBox(height: 10),
               buildTitle("New Arrivals"),
               AspectRatio(
                 aspectRatio: 1.6,
                   child: ProductsList()
               ),

               SizedBox(height: 10,),
               buildTitle("Best Sellers"),
               
              BestSeller(),
               
       ],
     ),
 );
 
  }

  Row buildTitle(String title) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Padding(
                 padding: const EdgeInsets.only(left: 20.0),
                 child: Text(title,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
               ),
               
               FlatButton(
                 onPressed: () {},
                  child: Row(
                   children: [
                     Text("Show all",
                     style: TextStyle(fontSize: 15),),
                     Icon(Icons.arrow_right),
                   ],
                 ),
               ),
               
             ],
           );
  }
  
}