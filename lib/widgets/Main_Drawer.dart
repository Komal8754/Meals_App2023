

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Tabs_Screen.dart';
import 'package:meals_app/Screens/filters_Screen.dart';

class MainDrawer extends StatefulWidget {


  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: Theme.of(context).accentColor,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('Cooking Up!',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,            color: Theme.of(context).primaryColor,
            ),),
          ),
        ListTile(
          leading: Icon(Icons.restaurant,size: 26,),
          title: Text('Meals',style: TextStyle(
              fontSize: 24,
              fontWeight:FontWeight.bold,
              fontFamily: "RobotoCondensed"

          ),),
          onTap:(){Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings,size: 26,),
          title: Text("Filters",style: TextStyle(
              fontSize: 24,
              fontWeight:FontWeight.bold,
              fontFamily: "RobotoCondensed"

          ),),
          onTap:(){Navigator.of(context).pushReplacementNamed(FiltersScreeen.routeName);
          },
        ),


        ],
      ),
    );
  }
}
