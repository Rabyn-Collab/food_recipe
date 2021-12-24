import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/providers/food_provider.dart';
import 'package:food_recipe/screens/crud_screen.dart';
import 'package:get/get.dart';



class DrawerWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            ),
              child: Center(child: Text('Food Recipe'))
          ),

          Consumer(
            builder: (context, ref, child) {
              final allData = ref.watch(allDataProvider);
              return ListTile(
                onTap: () {
              Get.to(() => CrudScreen());
                },
                leading: ImageIcon(AssetImage('assets/seafood.png')),
                title: Text('Food Setting'),
              );
            }
          ),

        ],
      ),
    );
  }
}
