import 'package:flutter/material.dart';
import 'package:furnitureApp/models/product.dart';
import 'package:furnitureApp/models/productList.dart';
import 'package:provider/provider.dart';

class ProductPrice extends StatefulWidget {
   
  final Product loadedProduct;
  
  ProductPrice({this.loadedProduct});

  @override
  _ProductPriceState createState() => _ProductPriceState(loadedProduct);
}

class _ProductPriceState extends State<ProductPrice> {
 final loadedProduct;
  int numOfItems = 1;
  double finalprice;
  _ProductPriceState(this.loadedProduct);

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
    finalprice = loadedProduct.price;
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Price per unit \$ ${loadedProduct.price}",style: TextStyle(color: Colors.blueGrey,
         fontSize: 15),),
          Text("\$${finalprice.toString()}",style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 20),),
          SizedBox(height: 3),
           
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              
              buildOutlineBox(icon: Icons.remove,
              press: () {
                if (numOfItems > 1) {
                setState(() {
                  decrement();
                  Provider.of<ProductList>(context, listen: false).updatePrice(loadedProduct, finalprice);
                });
                }
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(numOfItems.toString().padLeft(2,"0"),
                style: Theme.of(context).textTheme.headline6,
                ),

              ),
              buildOutlineBox(icon: Icons.add,
              press: () {
                setState(() {
                 increment();
                 Provider.of<ProductList>(context, listen: false).updatePrice(loadedProduct, finalprice);
                });
              }),
            ],
            ),
        ],
      ),
    );
  }

   SizedBox buildOutlineBox({IconData icon,Function press}) {
    return SizedBox(width: 40,height: 32,
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