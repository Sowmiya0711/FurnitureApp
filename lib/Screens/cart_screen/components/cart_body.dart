import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/order_completion/order_completion.dart';
import 'package:furnitureApp/Screens/product_details/components/product_price.dart';
import 'package:furnitureApp/extensions/colors.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:provider/provider.dart';


class CartBody extends StatelessWidget {
  
  final List<Product> cartList;
  
  CartBody({this.cartList});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
       body: Padding(
         padding: const EdgeInsets.only(left: 15.0,right: 10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("${cartList.length} items",
             style: TextStyle(fontSize: 20,color: Colors.grey),
             ),
             Expanded(
                            child: ListView.builder(
                 itemCount: cartList.length,
                 itemBuilder: (context,index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                 child: Padding(
                   padding: const EdgeInsets.all(10),
                   child: Row(
                     
                     children: [
                       Image.network(cartList[index].imageUrl,
                             width: SizeConfig.screenWidth * 0.2,
                             height: 100,),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal:25.0),
                               child: Text(cartList[index].title,
                               style: TextStyle(fontSize: 16,
                               fontWeight: FontWeight.w600,),),
                             ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                child: Text("Product ID: ${cartList[index].id}",
                             style: TextStyle(color: Colors.grey,fontSize: 15),),
                              ),
                             
                                  ProductPrice(loadedProduct: cartList[index],isToLoadProduct: false,),
                  
                           ],
                         ),
                       )
                     ],
                   ),
                      
                 ),
                  );
                 }),
             ),

            Container(
              alignment: Alignment.bottomRight,
              
              child: FlatButton(
                color:  HexColor.fromHex('#D9C9BD'),

              child: Text("Buy Now",style: TextStyle(
                color: Colors.white,
              fontSize: 18),),
              onPressed: () {
                Provider.of<ProductList>(context, listen: false).removeCartProduct();
                
                Navigator.of(context).
                pushReplacementNamed(OrderCompletion.routeName,);
                }),
            )
           ],
         ),

       ),
        
    );

  }
}