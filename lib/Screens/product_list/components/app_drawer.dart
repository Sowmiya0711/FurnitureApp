import 'package:flutter/material.dart';
import 'package:furnitureApp/models/user.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<UserModel>(context,listen: false);
  
    return Drawer(
         child: ListView(
          
           children: <Widget>[
             
             DrawerHeader(
               padding: EdgeInsets.only(left: 30,top: 30),
               
             child:
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   CircleAvatar(backgroundImage:
                    AssetImage('assets/icons/userAvatar.png'),
                    radius: 30,),
                   SizedBox(width: 10),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(user.userName,
                       style: TextStyle(fontSize: 17),),
                       Text(user.email,
                       style: TextStyle(fontSize: 17)),
                     ],
                   ),
                 ],
               )),
               Divider(height: 20,color: Colors.black),
             buildListTile("Home", Icons.home),
            buildListTile("New Collections", Icons.new_releases),
            buildListTile("Top Deals", Icons.details),
            buildListTile("Logout", Icons.logout),
           ],)
       );
  }

  ListTile buildListTile(String title,IconData icon) {
    return ListTile(
             contentPadding: EdgeInsets.only(left: 50),
             leading: Icon(icon,size: 30,),
             title: Transform(
            transform: Matrix4.translationValues(-16, 0.0, 0.0),
            child:Text(title,style: TextStyle(fontSize: 18),),
             )
           );
  }
}