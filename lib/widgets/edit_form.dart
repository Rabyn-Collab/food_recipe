import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:food_recipe/providers/crud_provider.dart';




class EditForm extends StatelessWidget {

 final Food food;
 final String label;
 EditForm(this.food, this.label);

 final _form = GlobalKey<FormState>();

 final foodController = TextEditingController();
 final ingredientsController = TextEditingController();
 final instructionController = TextEditingController();
 final videoController = TextEditingController();
 final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Customize meal'),
      ),
        body: Form(
          key: _form,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                   TextFormField(
                     controller: foodController..text = food.foodName,
                     decoration: InputDecoration(
                       label: Text('foodName')
                     ),
                   ),
                   SizedBox(height: 10,),
                  TextFormField(
                    controller:  instructionController..text = food.instructions,
                    decoration: InputDecoration(
                        label: Text('instruction')
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: imageController..text = food.imageUrl,
                    decoration: InputDecoration(
                        label: Text('imageUrl')
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: videoController..text = food.videoUrl,
                    decoration: InputDecoration(
                        label: Text('videoUrl')
                    ),
                  ),
                  SizedBox(height: 20,),

                  Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 38)
                          ),
                          onPressed: () {
                            _form.currentState.save();
                            final newFood = Food(
                                foodName: foodController.text.trim(),
                                id: foodController.text.trim(),
                                imageUrl: imageController.text.trim(),
                                ingredients: food.ingredients,
                                instructions: instructionController.text.trim(),
                                videoUrl: videoController.text.trim()
                            );
                            ref.read(crudProvider).upDateData(food.id, label, newFood);
                          },
                          child: Text('update', style: TextStyle(fontSize: 18),)
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
