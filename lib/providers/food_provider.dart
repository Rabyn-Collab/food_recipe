import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/api.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:http/http.dart' as http;


final chickenProvider = FutureProvider.autoDispose((ref) => FoodProvider().getChicken());
final pastaProvider = FutureProvider.autoDispose((ref) => FoodProvider().getPasta());
final porkProvider = FutureProvider.autoDispose((ref) => FoodProvider().getPork());
final seaFoodProvider = FutureProvider.autoDispose((ref) => FoodProvider().getSeaFood());
final foodProvider = Provider((ref) => FoodProvider());


class FoodProvider{


  Future<List<Food>> getChicken () async{
    try{
      final response =  await http.get(Uri.parse(Api.getChicken));
      final extractData = jsonDecode(response.body);
      List<Food> data = (extractData as List).map((e) => Food.fromJson(e) ).toList();
      return data;
    }catch(err){
      throw err;
    }
  }

  Future<List<Food>> getPork () async{
    try{
      final response =  await http.get(Uri.parse(Api.getPork));
      final extractData = jsonDecode(response.body);
      List<Food> data = (extractData as List).map((e) => Food.fromJson(e) ).toList();
      return data;
    }catch(err){
      throw err;
    }
  }

  Future<List<Food>> getPasta () async{
    try{
      final response =  await http.get(Uri.parse(Api.getPasta));
      final extractData = jsonDecode(response.body);
      List<Food> data = (extractData as List).map((e) => Food.fromJson(e) ).toList();
      return data;
    }catch(err){
      throw err;
    }
  }

  Future<List<Food>> getSeaFood () async{
    try{
      final response =  await http.get(Uri.parse(Api.getSeafood));
      final extractData = jsonDecode(response.body);
      List<Food> data = (extractData as List).map((e) => Food.fromJson(e) ).toList();
      return data;
    }catch(err){
      throw err;
    }
  }

}




final allDataProvider = StateNotifierProvider<AllDataProvider, List<List<Food>>>((ref) => AllDataProvider());
//final streamAllData = StreamProvider((ref) => AllDataProvider().streamData());
class AllDataProvider extends StateNotifier<List<List<Food>>>{

  AllDataProvider() : super([]){
    getAllData();
  }


  // Stream<List<List<Food>>> streamData() async*{
  //     while(true){
  //       final data = await getAllData();
  //       Future.delayed(Duration(seconds: 2));
  //        yield data;
  //     }
  //
  // }
  Future<void> getAllData() async{

   final responses = await Future.wait([
     http.get(Uri.parse(Api.getChicken)),
     http.get(Uri.parse(Api.getPasta)),
     http.get(Uri.parse(Api.getPork)),
     http.get(Uri.parse(Api.getSeafood)),
   ]);


   List<Food> data = ( jsonDecode(responses[0].body) as List).map((e) => Food.fromJson(e)).toList();
   List<Food> data1 = ( jsonDecode(responses[1].body) as List).map((e) => Food.fromJson(e)).toList();
   List<Food> data2 = ( jsonDecode(responses[2].body) as List).map((e) => Food.fromJson(e)).toList();
   List<Food> data3 = ( jsonDecode(responses[3].body) as List).map((e) => Food.fromJson(e)).toList();

   state = [data,data1, data2, data3];
   // state.add(data);
   // state.add(data1);
   // state.add(data2);
   // state.add(data3);


  }



}



