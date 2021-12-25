import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_recipe/models/food_model.dart';
import 'package:food_recipe/widgets/food_detail.dart';
import 'package:get/get.dart';


class FoodScreen extends StatelessWidget {
final AsyncValue<List<Food>> data;
FoodScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return  data.when(
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
                itemCount: data.length,
                itemBuilder: (context, index){
                  final food = data[index];
                  return Column(
                    children: [
                      Text(food.foodName!, style: TextStyle(fontSize: 17, ), overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.to(() => FoodDetail(food), transition: Transition.leftToRight, opaque: true);
                        },
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(imageUrl: food.imageUrl!, fit: BoxFit.cover,))),
                      ),
                    ],
                  );
                }
            ),
          );
        },
        error: (err, stack) => Center(child: Text('$err')),
        loading: () => Center(child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),),
    );
  }
}
