import 'package:flutter/material.dart';
import 'package:meals_app/Screens/CategoryMeals.dart';
import 'package:meals_app/Screens/filters_Screen.dart';
import 'package:meals_app/models/Category.dart';

import 'Screens/CategoryScreen.dart';
import 'Screens/Tabs_Screen.dart';
import 'Screens/meal_details_screen.dart';
import 'Screens/meal_details_screen.dart';
import 'models/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters={
    "gluten":false,
    "lactose":false,
    "vegan":false,
  "vegetarian":false
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favouriteMeals=[];

void _setFilters(Map<String, bool> filterData){
// setState(() {
//   _filters=filterData;
//
//   _availableMeals=DUMMY_MEALS.where((meal) {
// if(_filters['gluten']!&&!meal.isGlutenFree){
//   return false;
// }if(_filters['lactose']!&&!meal.isLactoseFree){
//   return false;
// }if(_filters['vegan']!&&!meal.isVegan){
//   return false;
// }if(_filters['vegetarian']!&&!meal.isVegetarian){
//   return false;
// }
//   }).toList();
// });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1:TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),

            ),
              bodyText2:const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),

          ), subtitle1: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCOndensed',
fontWeight: FontWeight.bold
          ),
          ),
          fontFamily: 'Raleway',

      ),
      debugShowCheckedModeBanner: false,
initialRoute: '/',
routes: {
        '/':(ctx)=> TabsScreen(favouriteMeals: _favouriteMeals),
        '/categories-meals':(ctx)=> CategoryMealsScreen( availableMeals: _availableMeals,),
  MealsDetailsScreen.routeName:(ctx)=>MealsDetailsScreen(),
  FiltersScreeen.routeName:(ctx)=>FiltersScreeen( setFilters: _setFilters,currentFilters: _filters),
},

    );
  }
}

