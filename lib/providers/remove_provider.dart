import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:http/http.dart' as http;



final removeProvider = Provider((ref) => RemoveProvider());



class RemoveProvider{


  Future<void>  removeData(String id,  String label, BuildContext context) async{

    if(label == 'Chicken'){
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/chicken/$id';

      try{
        final response = await http.delete(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);
        print(response.statusCode);
      }catch(err){

      }

    }else if(label == 'Pork'){
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pork/$id';
      try{
        final response = await http.delete(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);
        print(response.statusCode);

      }catch(err){

      }

    }else if(label == 'Pasta'){

      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/pasta/$id';
      try{
        final response = await http.delete(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);
        print(response.statusCode);

      }catch(err){

      }

    }else{
      final url = 'https://61b33c1faf5ff70017ca1d66.mockapi.io/seafood/$id';
      try{

        final response = await http.delete(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },);
        print(response.statusCode);

      }catch(err){
      }

    }

  }



}