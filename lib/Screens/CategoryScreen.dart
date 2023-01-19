import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/Category_Item.dart';

import '../models/Category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
 return GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2.5,
            crossAxisSpacing: 20,
            mainAxisExtent: 200),
        children: DUMMY_CAT
            .map((catData) =>
                CategoryItem(title: catData.title, id: catData.id, color: catData.color,))
            .toList(),
      );
  }
}
