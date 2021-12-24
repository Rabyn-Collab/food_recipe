import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';




class SampleScreen extends StatelessWidget {

final AsyncValue<List<List<Food>>> allData;

SampleScreen(this.allData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: allData.when(
            data: (data){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 7,
                        crossAxisSpacing: 7,
                        mainAxisExtent: 230
                    ),
                    itemCount: data[0].length,
                    itemBuilder: (context, index){
                      final food = data[0][index];
                      return Column(
                        children: [
                          Text(food.foodName, style: TextStyle(fontSize: 17, ), overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                             // Get.to(() => FoodDetail(food), transition: Transition.leftToRight);
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(imageUrl: food.imageUrl, fit: BoxFit.cover,))),
                          ),
                        ],
                      );
                    }
                ),
              );
            },
            error: (err, stack) => Center(child: Text('$err')),
            loading: () => Center(child: CircularProgressIndicator(),)
        )
    );
  }
}
