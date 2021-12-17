import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/api.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:http/http.dart' as http;


final data1Provider = FutureProvider((ref) => FoodFetch().getChicken());
final data2Provider = FutureProvider((ref) => FoodFetch().getPasta());
final data3Provider = FutureProvider((ref) => FoodFetch().getPork());
final data4Provider = FutureProvider((ref) => FoodFetch().getSeafood());
final dataStream = StreamProvider((ref) => FoodFetch().getData());

class FoodFetch{



  Stream<List<Food>> getData() async*{
    while(true){
     Future.delayed(Duration(milliseconds: 500));
     final data = await getChicken();
     yield data;
    }

  }


 Future<List<Food>> getChicken() async{
   try{
   final response =  await http.get(Uri.parse(Api.getChicken));
   final extractData = jsonDecode(response.body);
   print(response.body);
   final data = (extractData as List).map((e) => Food.fromJson(e)).toList();
   return data;
  }catch(err){
   throw err;
  }
}

 Future<List<Food>> getPasta() async{
   try{
     final response =  await http.get(Uri.parse(Api.getPasta));
     final extractData = jsonDecode(response.body);
     final data = (extractData as List).map((e) => Food.fromJson(e)).toList();
     return data;
   }catch(err){
     throw err;
   }
 }

 Future<List<Food>> getPork() async{
   try{
     final response =  await http.get(Uri.parse(Api.getPork));
     final extractData = jsonDecode(response.body);
     final data = (extractData as List).map((e) => Food.fromJson(e)).toList();
     return data;
   }catch(err){
     throw err;
   }
 }

 Future<List<Food>> getSeafood() async{
   try{
     final response =  await http.get(Uri.parse(Api.getSeafood));
     final extractData = jsonDecode(response.body);
     final data = (extractData as List).map((e) => Food.fromJson(e)).toList();
     return data;
   }catch(err){
     throw err;
   }
 }








}