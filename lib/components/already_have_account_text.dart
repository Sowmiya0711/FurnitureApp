import 'package:flutter/material.dart';
import '../size_config.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';

class AlreadyAccountExists extends StatelessWidget {
  const AlreadyAccountExists({
    Key key,
  }) : super(key: key);
  
 

  @override
  Widget build(BuildContext context) {
   
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            InheritedSigninProvider.of(context).toggleView();
          },
          child: Text(
            "Sign in",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                ),
          ),
        ),
      ],
    );
  }
}
