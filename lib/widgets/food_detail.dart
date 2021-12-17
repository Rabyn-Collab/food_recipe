
import 'package:flutter/material.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class FoodDetail extends StatelessWidget {
  final Food food;
  FoodDetail(this.food);
  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(food.videoUrl);
    return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(food.foodName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            ),
           Container(
             child: Hero(
                 tag: food.imageUrl,
                 child: Image.network(food.imageUrl)),
           ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text('Making Instructions:', style: TextStyle(fontSize: 18),),
          ),
           Container(
             height: 350,
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
             width: double.infinity,
             child: Card(
               child: SingleChildScrollView(
                 child: Text(food.instructions, style: TextStyle(fontSize: 15, wordSpacing: 3, letterSpacing: 1),
                 textAlign: TextAlign.justify,
                 ),
               ),
             ),
           ),

            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text('Ingredients:', style: TextStyle(fontSize: 18),),
            ),

            _buildText(food.ingredients.s1, '1'),
            _buildText(food.ingredients.s2, '2'),
            _buildText(food.ingredients.s3, '3'),
            _buildText(food.ingredients.s4, '4'),
            _buildText(food.ingredients.s5, '5'),
            _buildText(food.ingredients.s6, '6'),
            _buildText(food.ingredients.s7, '7'),

            YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: videoId,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: true,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                ),
          ],
        ),
    );
  }
  Container _buildText(String label, String nums) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text('$nums. $label', style: TextStyle(fontSize: 16, color: Colors.pink),),
    );
  }

}
