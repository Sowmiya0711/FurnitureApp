import 'package:flutter/material.dart';
import 'package:furnitureApp/Screens/sign_in/loginScreen.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
     
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/LoginBackground.jpg',),
                    fit: BoxFit.cover

                  )
                ),
              ),
               
               Container(
                       margin: EdgeInsets.only(top: 100,left: size.width / 4),
                         height: size.height * 0.5,
                         width: size.width * 0.5,
                           alignment: Alignment.center, 
                           child: Image.asset('assets/Logo.jpg',
                           
                           ),
                            
                      ),
              
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * 0.7,
                      child:  ClipRRect(
                        
                        borderRadius: BorderRadius.circular(50),
                                          child: FlatButton(
                                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          onPressed: () {Navigator.pushNamed(context, LoginScreen.routeName);},
                        color: Colors.black,
                     child: Text("LOGIN",
                     style: TextStyle(color: Colors.white,
                     fontSize: 17))),
                      )
                      ),
                      SizedBox(height: 10),
                       Container(
                        width: size.width * 0.7,
                      child:  ClipRRect(
                        
                        borderRadius: BorderRadius.circular(50),
                                          child: FlatButton(
                                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          onPressed: () {},
                        color: Colors.white,
                     child: Text("SIGN UP",
                     style: TextStyle(color: Colors.black,
                     fontSize: 17))),
                      )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
    
  }
}