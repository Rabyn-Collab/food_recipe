import 'package:flutter/material.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class DetailScreen extends StatelessWidget {

  final Food food;
  DetailScreen(this.food);

  @override
  Widget build(BuildContext context) {
   final videoId = YoutubePlayer.convertUrlToId(food.videoUrl!)!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                    Text(food.foodName!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: 250,
                          child: SingleChildScrollView(
                              child: Text(food.instructions!, textAlign: TextAlign.justify, style: TextStyle(wordSpacing: 2, fontSize: 16, color: Colors.blueGrey),))
                      )
                  ),
                SizedBox(height: 15,),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Ingredients:', style: TextStyle(fontSize: 20,),)),
                  SizedBox(height: 15,),
                  buildContainer('1', food.ingredients!.s1!),
                  buildContainer('2', food.ingredients!.s2!),
                  buildContainer('3', food.ingredients!.s3!),
                  buildContainer('4', food.ingredients!.s4!),
                  buildContainer('5', food.ingredients!.s5!),
                  buildContainer('6', food.ingredients!.s6!),
                  buildContainer('7', food.ingredients!.s7!),
                  SizedBox(height: 15,),
                  Container(
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoId,
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                        ),)
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

  Container buildContainer(String order, String label) {
    if (label.isEmpty) {
      return Container();
    } else {
      return Container(
          alignment: Alignment.centerLeft,
          child: Text('$order. $label', style: TextStyle(fontSize: 17, color: Colors.pink)));

    }
  }
}
