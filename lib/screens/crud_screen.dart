import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/providers/food_provider.dart';
import 'package:food_recipe/providers/remove_provider.dart';
import 'package:food_recipe/widgets/addForm.dart';
import 'package:food_recipe/widgets/edit_form.dart';
import 'package:get/get.dart';

import 'home_screen.dart';



class CrudScreen extends ConsumerWidget {

  // final List<List<Food>>  allData;
  //  CrudScreen(this.allData);

   final foodNames = ['Chicken', 'Pasta', 'Pork', 'Seafood'];
  @override
  Widget build(BuildContext context, ref) {
    final allData = ref.watch(allDataProvider);
    return Scaffold(
        body: allData.length == 0 ? Center(child: CircularProgressIndicator(),) : ListView.builder(
            itemCount: allData.length,
            itemBuilder: (context, index){
              return ExpansionTile(
                trailing: Container(
                    width: 120,
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: (){
                              Get.to(() => AddForm(foodNames[index]));
                            },
                            child: Text('Add',style: TextStyle(color: Colors.brown),)),
                        SizedBox(width: 20,),
                        Icon((Icons.arrow_downward_sharp))
                      ],
                    )),
                  title: Text(foodNames[index]),
              children: allData[index].map((e){
                return ListTile(
                  leading: Image.network(e.imageUrl!),
                  title: Text(e.foodName!),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              Get.to(() => EditForm(e, foodNames[index]));
                            }, icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () async{
                              await ref.read(removeProvider).removeData(e.id, foodNames[index],  context, );
                              ref.refresh(allDataProvider);
                              ref.refresh(chickenProvider);
                              ref.refresh(porkProvider);
                              ref.refresh(seaFoodProvider);
                              ref.refresh(pastaProvider);
                              Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
                            }, icon: Icon(Icons.delete)),


                      ],
                    ),
                  ),

                );
              }).toList(),
              );
            },
        )
    );
  }
}
