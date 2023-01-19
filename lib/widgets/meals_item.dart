

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/meal_details_screen.dart';
import '../models/meals.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  const MealItems({required this.title,
    required this.affordability,
    required this.duration,
    required this.complexity,
    required this.imageUrl,
    required this.id,
    required this.removeItem
  });
  String get complexityText{
    switch (complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }
  String get affordabilityText{
    switch (affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context){
Navigator.of(context).pushNamed(MealsDetailsScreen.routeName,arguments: id,
).then((result) {
if(result!=null){
  removeItem(result);
}});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:()=> selectMeal(context),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
             ClipRRect(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
               child: Image.network(imageUrl,height: 300,width: double.infinity,fit: BoxFit.cover,),
             ) ,
              Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    color: Colors.black54,
                    width: 220,//smaller than image
                    child: Text(title,style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ))
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
Row(
  children: [
    Icon(Icons.schedule),
    SizedBox(width: 6),
    Text("${duration } min")
  ],
),
 Row(
  children: [
    Icon(Icons.work),
    SizedBox(width: 6),
    Text("${complexityText }")
  ],
),
                Row(
  children: [
    Icon(Icons.attach_money),
    SizedBox(width: 6),
    Text("${affordabilityText }")
  ],
),
              ],
            ),
          )

        ],
      ),
    ),);
  }
}
