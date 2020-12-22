import 'package:flutter/material.dart';
import 'package:furnitureApp/components/already_have_account_text.dart';
import 'package:furnitureApp/size_config.dart';
import 'package:furnitureApp/Screens/sign_up/components/signup_form.dart';

class SignupBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
                  child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text("Personal details",
              style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold),),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignupForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
             
              AlreadyAccountExists(),
              SizedBox(height: 5),
            ],
          ),
        ),
      )
    );
  }
}