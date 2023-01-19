import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Screens/CategoryScreen.dart';
import 'package:meals_app/Screens/filters_Screen.dart';

import '../models/meals.dart';
import '../widgets/Main_Drawer.dart';
import 'FavouriteScreens.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen({required this.favouriteMeals});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages=[
    CategoriesScreen(),
    FavouriteScreens()
  ];
  int _selectedPageIndex=0;

@override
void initState() {
    // TODO: implement initState
    super.initState();
  }


  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meals Wheel'),


        ),

        drawer: MainDrawer(),
        body:_pages[_selectedPageIndex],

       bottomNavigationBar :BottomNavigationBar(
          onTap:_selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor:Theme.of(context).accentColor ,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
            label: 'Category'
       ),    BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
            label: 'Favourite',
       ),
          ],
        ));
  }
}


