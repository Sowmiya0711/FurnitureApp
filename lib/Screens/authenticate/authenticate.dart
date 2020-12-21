import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/sign_in.dart';
import 'package:furnitureApp/homePage.dart';
import 'package:furnitureApp/Screens/sign_up/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showHomePage = true;
  bool showSignIn = false;
  bool showSignup = false;

  void toggleHomePage(bool showSignup) {
    setState(() => showHomePage = !showHomePage);
    if (showSignup) {
      this.showSignup = !this.showSignup;
    } else {
      showSignIn = !showSignIn;
    }
  }


  void toggleSignInView() {
    setState(() {
      showSignIn = !showSignIn;
      showSignup = !showSignup;
    });
  }

  void toggleSignupView() {
    setState(() {
      showSignup = !showSignup;
      showSignIn = !showSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showHomePage)
    {
      return HomePage(toggleHomePage: toggleHomePage);
    } else if (showSignIn) {
      return SignIn(toggleView: toggleSignInView);
    } else if(showSignup) {
      return Signup(toggleView: toggleSignupView);
    }
  }
}