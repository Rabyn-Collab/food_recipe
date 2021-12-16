import 'package:flutter/material.dart';



class DrawerWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white70,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange
              ),
                child: Center(child: Text('Welcome to Food Land', style: TextStyle(fontSize: 20, color: Colors.white),))
            ),
            ListTile(
              leading: ImageIcon(AssetImage('assets/seafood.png')),
              title: Text('foods settings'),
            ),
          ],
        ),
      ),
    );
  }
}
