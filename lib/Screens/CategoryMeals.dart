import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/main.dart';

import '../models/meals.dart';
import '../widgets/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(  {required this.availableMeals});

  @override

  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

 late String categoryTitle;
late List<Meal> displayedMeals;
var _loadedInitData=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

 void _removeMeal(String mealId){
setState(() {

  displayedMeals.removeWhere((meal) => mealId==mealId);
});
 }
 @override
 void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title']!;
      displayedMeals= widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData=true;
    }


    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("${categoryTitle}")),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              title: displayedMeals[index].title,
              affordability: displayedMeals[index].affordability,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              imageUrl: displayedMeals[index].imageUrl,
              id: displayedMeals[index].id, removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
