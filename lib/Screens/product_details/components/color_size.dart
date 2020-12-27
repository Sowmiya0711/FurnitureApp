import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';

class ColorAndSize extends StatefulWidget {
  @override
  _ColorAndSizeState createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
 

  @override
  Widget build(BuildContext context) {
     final loadedProduct = InheritedProductDetailsProvider.of(context).loadedProduct;
    
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Color",style: TextStyle(fontSize: 20),),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: loadedProduct.colors.length,
                    itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                          
                            for(int i = 0; i < loadedProduct.colors.length; i++) {
                           
                            if (i == index) {
    setState(() {
    
    loadedProduct.colors[i]["isSelected"] = true;
    });
} else {
    setState(() {
    
    loadedProduct.colors[i]["isSelected"] = false;
    });
} 
                          }
                      },
                    
                    child: ColorDot(color: Color(int.parse(loadedProduct.colors[index]["color"])),isSelected: loadedProduct.colors[index]["isSelected"],),
                    
                    
                    );
                    }
                  ),
                ),
              ],
            ),
    );
  }
}


class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final kDefaultPadding = 20.0;

  const ColorDot({
    Key key,
    this.color,
    // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: kDefaultPadding / 4,
        right: kDefaultPadding / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}