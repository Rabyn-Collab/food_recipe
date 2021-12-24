import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:http/http.dart' as http;



final addProvider = Provider((ref) => AddProvider());



class AddProvider{


  Future<void> addData( String label, Food food, BuildContext context, Map ingre) async{

    if(label == 'Chicken'){
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/chicken';

      try{
        final response = await http.post(Uri.parse(url), body: jsonEncode({
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

    }else if(label == 'Pork'){
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pork';
      try{
        final response = await http.post(Uri.parse(url), body: jsonEncode({
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

      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pasta';
      try{
        final response = await http.post(Uri.parse(url), body: jsonEncode({
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
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/seafood';
      try{

        final response = await http.post(Uri.parse(url), body: jsonEncode({
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