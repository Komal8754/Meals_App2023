

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/Main_Drawer.dart';

class FiltersScreeen extends StatefulWidget {
static const routeName='/filters';
final Function setFilters;
final Map<String, bool> currentFilters;

const FiltersScreeen({required this.setFilters,required this.currentFilters});
  @override
  State<FiltersScreeen> createState() => _FiltersScreeenState();
}

class _FiltersScreeenState extends State<FiltersScreeen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;
  @override
  void initState() {
    _glutenFree=widget.currentFilters['gluten']!;
    _lactoseFree=widget.currentFilters['lactose']!;
    _vegetarian=widget.currentFilters['vegetarian']!;
    _vegan=widget.currentFilters['vegan']!;
    super.initState();
  }
  Widget buildSwitchListTile(String title,String subtitle, bool currentValue,Function updateValue){
   return SwitchListTile(title:Text(title),value: _glutenFree,subtitle: Text(subtitle), onChanged: updateValue(),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text('Your Filter'),
actions: [
  IconButton(onPressed:() {
    final  Map<String, bool> selectedfilters={
      "gluten":_glutenFree,
      "lactose":_lactoseFree,
      "vegan":_vegan,
      "vegetarian":_vegetarian
    };
    widget.setFilters(selectedfilters);}, icon: Icon(Icons.save))
],
),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',style: Theme.of(context).textTheme.titleLarge,),
          ),
          Expanded(child: ListView(children: [
            // buildSwitchListTile("Gluten-free",'Only contain gluten free meals',_glutenFree,(newValue){setState(() {
            //   _vegan=newValue;
            // });}),
            // buildSwitchListTile("Gluten-free",'Only contain gluten free meals',_glutenFree,(newValue){setState(() {
            //   _vegan=newValue;
            // });}),
            // buildSwitchListTile("Gluten-free",'Only contain gluten free meals',_glutenFree,(newValue){setState(() {
            //   _vegan=newValue;
            // });}),
            // buildSwitchListTile("Gluten-free",'Only contain gluten free meals',_glutenFree,(newValue){setState(() {
            //   _vegan=newValue;
            // });}),
            // buildSwitchListTile(),
            // buildSwitchListTile(),

            SwitchListTile(title:Text('Gluten-free'),value: _glutenFree,subtitle: Text('Only contain gluten free meals'), onChanged: (newValue){
              setState(() {
                _glutenFree=newValue;
              });
            }),SwitchListTile(title:Text('Lactose-free'),value: _lactoseFree,subtitle: Text('Only contain Lactose free meals'), onChanged: (newValue){
              setState(() {
                _lactoseFree=newValue;
              });
            }),SwitchListTile(title:Text('Vegetarian'),value: _vegetarian,subtitle: Text('Only contain vegeterian meals'), onChanged: (newValue){
              setState(() {
                _vegetarian=newValue;
              });
            }),SwitchListTile(title:Text('Vegan'),value: _vegan,subtitle: Text('Only contain Vegan meals'), onChanged: (newValue){
              setState(() {
                _vegan=newValue;
              });
            }),
          ],))
        ],
      ),
    );
  }
}
