import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';

class MealsDetailsScreen extends StatefulWidget {
  static const routeName ='/meals-details';
  const MealsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MealsDetailsScreen> createState() => _MealsDetailsScreenState();
}

class _MealsDetailsScreenState extends State<MealsDetailsScreen> {
Widget  buildSectionTitle(BuildContext context,String title){
return  Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(title,style: Theme.of(context).textTheme.titleLarge),
  );
}

Widget buildCard(BuildContext context, Widget child){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),borderRadius:
    BorderRadius.circular(10)
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    height: 200,
    width: 300,
    child:child
  );

}

  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)?.settings.arguments;
final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {

        Navigator.of(context).pop(mealId);
      },child: Icon(Icons.delete_outline_outlined),),
      appBar: AppBar(title: Text("${selectedMeal.title}"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            ),
            buildSectionTitle(context,'Ingrediants'),
            buildCard(context, ListView.builder(
              itemBuilder: (context, index) { return
                Card(
                  color: Theme.of(context).accentColor,
                  child:   Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5),
                    child: Text(
                      '${selectedMeal.ingredients[index]}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                );

              }
              ,
              itemCount: selectedMeal.ingredients.length,

            ),),
            buildSectionTitle(context,'Steps'),
            buildCard(context, ListView.builder(

              itemBuilder: (context, index) { return
              ListTile(
                leading: CircleAvatar(child: Text('# ${(index+1)}'),),
                title: Text(selectedMeal.steps[index]));



              }
              ,
              itemCount: selectedMeal.steps.length,

            ),),
          ],
        ),
      ),
    );
  }
}
