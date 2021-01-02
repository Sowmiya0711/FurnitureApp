import 'package:flutter/material.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:provider/provider.dart';

class ProductPrice extends StatefulWidget {
   
  final Product loadedProduct;
  final bool isToLoadProduct;

  ProductPrice({this.loadedProduct,this.isToLoadProduct});

  @override
  _ProductPriceState createState() => _ProductPriceState(loadedProduct,isToLoadProduct);
}

class _ProductPriceState extends State<ProductPrice> {
 final loadedProduct;
 final isToLoadProduct;
  int numOfItems;
  double finalprice;
  
_ProductPriceState(this.loadedProduct,this.isToLoadProduct);

void increment() {
    setState(() {
      numOfItems++;
      finalprice= loadedProduct.price*numOfItems;
    });
  }

  void decrement() {
    setState(() {
      numOfItems--;
      finalprice=loadedProduct.price*numOfItems;
    });
  }

  @override
  void initState() {
    super.initState();
   finalprice =  loadedProduct.cartPrice == null ? loadedProduct.price : loadedProduct.cartPrice;
    numOfItems = loadedProduct.cartItemCount == null ? 1 : loadedProduct.cartItemCount;
  }

@override
void didUpdateWidget(ProductPrice oldWidget) {
  if (oldWidget != widget) {
    // values changed, restart animation.
     finalprice = loadedProduct.cartPrice == null ? loadedProduct.price : loadedProduct.cartPrice;
    numOfItems = loadedProduct.cartItemCount == null ? 1 : loadedProduct.cartItemCount;
  }
  super.didUpdateWidget(oldWidget);
}

  @override
  Widget build(BuildContext context) {
    
    return  
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Price per unit \$ ${loadedProduct.price}",style: TextStyle(color: Colors.blueGrey,
         fontSize: 15),),
         Text("\$${finalprice.toString()}",style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: !isToLoadProduct ? FontWeight.bold : FontWeight.normal,
            fontSize: isToLoadProduct ? 20 : 18),),
         
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              
              buildOutlineBox(icon: Icons.remove,
              press: () {
                if (numOfItems > 1) {
                 decrement();
                  Provider.of<ProductList>(context, listen: false).updatePrice(loadedProduct, finalprice,numOfItems);
                }
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(numOfItems.toString().padLeft(2,"0"),
                style: Theme.of(context).textTheme.headline6.copyWith(fontSize: isToLoadProduct ? 17 : 15),
               
                ),

              ),
              buildOutlineBox(icon: Icons.add,
              press: () {
                increment();
                 Provider.of<ProductList>(context, listen: false).updatePrice(loadedProduct, finalprice,numOfItems);
                
              }),
            ],
            ),
        ],
      ),
    );
  }

   SizedBox buildOutlineBox({IconData icon,Function press}) {
    return SizedBox(width: isToLoadProduct ? 40 : 30,height: isToLoadProduct ? 32 : 25,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        onPressed: press,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13)),
        child: Icon(icon),
        )
      
      );
  }
 
}