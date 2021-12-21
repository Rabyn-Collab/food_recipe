import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:http/http.dart' as http;



final crudProvider = Provider((ref) => CrudProvider());


class CrudProvider{


  Future<void> upDateData(String id, String label, Food food) async{

   if(label == 'Chicken'){
     final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/chicken/$id';

     try{
   final response = await http.patch(Uri.parse(url), body: jsonEncode({
     'imageUrl':  food.imageUrl,
     'id': food.id ,
     'foodName': food.foodName ,
     'videoUrl': food.videoUrl ,
     'ingredients':  food.ingredients,
     'instructions': food.instructions
   }),
     headers: <String, String>{
     'Content-Type': 'application/json; charset=UTF-8',
   },);
  print(response.statusCode);
   print(response.body);

     }catch(err){

     }

   }else if(label == 'Pork'){
     final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pork/$id';
     try{

     }catch(err){

     }

   }else if(label == 'Pasta'){
     final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pasta/$id';
     try{

     }catch(err){

     }

   }else{
     final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/seafood/$id';
     try{

     }catch(err){

     }

   }






  }



}