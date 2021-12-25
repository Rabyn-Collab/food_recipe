import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:food_recipe/providers/add_provider.dart';
import 'package:food_recipe/providers/food_provider.dart';
import 'package:food_recipe/screens/home_screen.dart';
import 'package:get/get.dart';



class AddForm extends StatelessWidget {

  final String label;
  AddForm( this.label);

  final foodController = TextEditingController();
  final instructionController = TextEditingController();
  final imageController = TextEditingController();
  final videoController = TextEditingController();
  final ingre1Controller = TextEditingController();
  final ingre2Controller = TextEditingController();
  final ingre3Controller = TextEditingController();
  final ingre4Controller = TextEditingController();
  final ingre5Controller = TextEditingController();
  final ingre6Controller = TextEditingController();
  final ingre7Controller = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text('Update Items'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Card(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: foodController,
                      decoration: InputDecoration(
                          label: Text('FoodName')),
                    ),
                    TextFormField(
                      controller: instructionController,
                      decoration: InputDecoration(label: Text('Instruction')),
                    ),
                    TextFormField(
                      controller: imageController,
                      decoration: InputDecoration(label: Text('ImageUrl')),
                    ),
                    TextFormField(
                      controller: videoController,
                      decoration: InputDecoration(label: Text('VideoUrl')),
                    ),
                    _buildTextFormField('ingre1', ingre1Controller),
                    _buildTextFormField('ingre2', ingre2Controller),
                    _buildTextFormField('ingre3', ingre3Controller),
                    _buildTextFormField('ingre4', ingre4Controller),
                    _buildTextFormField('ingre5', ingre5Controller),
                    _buildTextFormField('ingre6', ingre6Controller),
                    _buildTextFormField('ingre7', ingre7Controller),

                    SizedBox(
                      height: 50,
                    ),
                    Consumer(
                        builder: (context, ref, child) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(200, 50)),
                              onPressed: () async {
                                _form.currentState!.save();
                                if (_form.currentState!.validate()) {
                                  _form.currentState!.save();
                                  final ingre = {
                                    '1': ingre1Controller.text.trim(),
                                    '2': ingre2Controller.text.trim(),
                                    '3': ingre3Controller.text.trim(),
                                    '4': ingre4Controller.text.trim(),
                                    '5': ingre5Controller.text.trim(),
                                    '6': ingre6Controller.text.trim(),
                                    '7': ingre7Controller.text.trim(),
                                  };
                                  final newFood = Food(
                                      foodName: foodController.text.trim(),
                                      id: foodController.text.trim(),
                                      imageUrl: imageController.text.trim(),
                                      instructions: instructionController.text
                                          .trim(),
                                      videoUrl: videoController.text.trim()
                                  );
                                  await ref.read(addProvider).addData(
                                      label, newFood, context, ingre);
                                  ref.refresh(allDataProvider);
                                  ref.refresh(chickenProvider);
                                  ref.refresh(porkProvider);
                                  ref.refresh(seaFoodProvider);
                                  ref.refresh(pastaProvider);
                                  Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
                                }
                              },
                              child: Text('Submit'));
                        }
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  TextFormField _buildTextFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(label: Text(label)),
    );
  }


}
