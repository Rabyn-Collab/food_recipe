import 'package:food_recipe/models/ingredients.dart';



class Food{
  final String id;
  final String imageUrl;
  final String foodName;
  final Ingredients ingredients;
  final String videoUrl;
  final String instructions;

  Food({
    this.imageUrl,
    this.id,
    this.foodName,
     this.ingredients,
    this.instructions,
    this.videoUrl
});


  factory Food.fromJson(Map<String, dynamic> json){
    return Food(
      imageUrl: json['imageUrl'] ,
      id: json['id'] ,
      foodName: json['foodName'] ,
      videoUrl: json['videoUrl'] ,
     ingredients:  Ingredients.fromJson(json['ingredients']),
      instructions: json['instructions']
    );
  }




}