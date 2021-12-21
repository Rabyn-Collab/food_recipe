import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/providers/food_provider.dart';
import 'package:food_recipe/widgets/edit_form.dart';
import 'package:get/get.dart';



class CrudScreen extends StatelessWidget {

  final labels = ['Chicken', 'Pasta', 'Pork', 'Seafood'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            label: Text('Add product', style: TextStyle(color: Colors.white),),
              onPressed: (){
              }, icon: Icon(Icons.add, color: Colors.white,))
        ],
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Food setting'),
      ),
        body: Consumer(
            builder: (context, ref, child) {
              final allData = ref.watch(allDataProvider);
              print(allData);
              return allData.length == 0 ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                   itemCount: allData.length,
                  itemBuilder: (context, index){
                     return ExpansionTile(
                         title: Text(labels[index]),
                       children: allData[index].map((e) {
                         return  ListTile(
                           leading: Image.network(e.imageUrl),
                           title: Text(e.foodName),
                           trailing: Container(
                             width: 100,
                             child: Row(
                               children: [
                                 IconButton(
                                     onPressed: (){
                                       Get.to(() => EditForm(e, labels[index]), transition: Transition.leftToRight);
                                     }, icon: Icon(Icons.edit)),
                                 IconButton(onPressed: (){

                                 }, icon: Icon(Icons.delete)),

                               ],
                             ),
                           ),
                         );
                       }).toList(),
                     );
                  }
              );
            }
    )
    );
  }
}
