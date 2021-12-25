import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:food_recipe/widgets/custom_progress_dialog.dart';
import 'package:http/http.dart' as http;



final crudProvider = Provider((ref) => CrudProvider());


class CrudProvider{



  Future upDateData(String? id, String label, Food food, BuildContext context, Map ingre) async{
final bar = CustomProgressBar.getBar(context);
    if(label == 'Chicken'){
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/chicken/$id';
  bar.show();
      try{
        final response = await http.patch(Uri.parse(url), body: jsonEncode({
          'imageUrl':  food.imageUrl,
          'id': food.id ,
          'foodName': food.foodName ,
          'videoUrl': food.videoUrl ,
          'ingredients':  ingre,
          'instructions': food.instructions
        }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);

        if(response.statusCode == 200){
          await  CustomProgressBar.dismissBar(bar);
          return 'Success';
        }
        print(response.statusCode);
      }catch(err){
           return '';
      }

    }else if(label == 'Pork'){
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pork/$id';
      try{
        final response = await http.patch(Uri.parse(url), body: jsonEncode({
          'imageUrl':  food.imageUrl,
          'id': food.id ,
          'foodName': food.foodName ,
          'videoUrl': food.videoUrl ,
          'ingredients':  ingre,
          'instructions': food.instructions
        }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);
        print(response.statusCode);

      }catch(err){

      }

    }else if(label == 'Pasta'){

      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pasta/$id';
      try{
        final response = await http.patch(Uri.parse(url), body: jsonEncode({
          'imageUrl':  food.imageUrl,
          'id': food.id ,
          'foodName': food.foodName ,
          'videoUrl': food.videoUrl ,
          'ingredients':  ingre,
          'instructions': food.instructions
        }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);
        print(response.statusCode);

      }catch(err){

      }

    }else{
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/seafood/$id';
      try{

        final response = await http.patch(Uri.parse(url), body: jsonEncode({
          'imageUrl':  food.imageUrl,
          'id': food.id ,
          'foodName': food.foodName ,
          'videoUrl': food.videoUrl ,
          'ingredients':  ingre,
          'instructions': food.instructions
        }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);
        print(response.statusCode);

      }catch(err){
      }

    }

  }



}