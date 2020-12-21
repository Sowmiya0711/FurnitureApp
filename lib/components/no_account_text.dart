import 'package:flutter/material.dart';
import '../size_config.dart';
import 'package:furnitureApp/Screens/sign_in/inheritedSignInProvider.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);
  
 

  @override
  Widget build(BuildContext context) {
   
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            InheritedSigninProvider.of(context).toggleView();
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                ),
          ),
        ),
      ],
    );
  }
}
