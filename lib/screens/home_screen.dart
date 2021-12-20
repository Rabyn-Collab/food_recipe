import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/providers/food_provider.dart';
import 'package:food_recipe/screens/food_screen.dart';
import 'package:food_recipe/widgets/drawer_widget.dart';




class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('Food Recipe'),
          backgroundColor: Colors.deepOrangeAccent,
          bottom: TabBar(
            indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text('Chicken'),
                  icon: ImageIcon(AssetImage('assets/chicken.png')
                  ),
                ),
                Tab(
                  child: Text('Pasta'),
                  icon: ImageIcon(AssetImage('assets/pasta.png')
                  ),
                ),
                Tab(
                  child: Text('Pork'),
                  icon: ImageIcon(AssetImage('assets/pork.png')
                  ),
                ),
                Tab(
                  child: Text('Seafood'),
                  icon: ImageIcon(AssetImage('assets/seafood.png')
                  ),
                ),
              ],
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final chicken = ref.watch(chickenProvider);
            final pork = ref.watch(porkProvider);
            final pasta = ref.watch(pastaProvider);
            final seaFood = ref.watch(seaFoodProvider);
            return TabBarView(
                children: [
                  FoodScreen(chicken),
                  FoodScreen(pasta),
                  FoodScreen(pork),
                  FoodScreen(seaFood),
                ]
            );
          }
        )
      ),
    );
  }
}
