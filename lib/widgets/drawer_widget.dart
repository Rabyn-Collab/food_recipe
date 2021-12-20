import 'package:flutter/material.dart';
import 'package:food_recipe/screens/crud_screen.dart';
import 'package:get/get.dart';



class DrawerWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
       child: Column(
         children: [
         DrawerHeader(
           decoration: BoxDecoration(
             color: Colors.deepOrange
           ),
             child: Center(child: Text('Food Recipe'))
         ),
          ListTile(
            onTap: (){
              Get.to(() => CrudScreen(), transition: Transition.leftToRight);
            },
            leading: ImageIcon(AssetImage('assets/seafood.png')),
            title: Text('Food setting'),
          )
         ],
       ),
      ),
    );
  }
}
