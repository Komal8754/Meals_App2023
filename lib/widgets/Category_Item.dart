import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/CategoryMeals.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;


  const CategoryItem({required this.title, required this.id,required this.color}) ;


  void selectedItem(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/categories-meals',arguments: {'id':id,'title':title});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectedItem(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          padding: EdgeInsets.all(5),
          child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color
              ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
