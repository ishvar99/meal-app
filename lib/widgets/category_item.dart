import 'package:flutter/material.dart';
import '../models/category.dart';
import '../pages/Meals.dart';

class categoryItem extends StatelessWidget {
  final Category category;
  categoryItem(this.category);
  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(MealsPage.namedRoute,
        arguments: {'id': category.id, 'title': category.title});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //InkWell is a GestureDetector with ripple effect on tap
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        // height: 100,
        // width: 150,
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
        // color: Colors.green,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.7), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
