import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favorites;
  FavoritesPage(this.favorites);
  @override
  Widget build(BuildContext context) {
    return favorites.isEmpty
        ? Center(
            child: Text(
              'Currently, No favorites are availabe!',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return mealItem(
                id: favorites[index].id,
                title: favorites[index].title,
                imageUrl: favorites[index].imageUrl,
                affordability: favorites[index].affordability,
                complexity: favorites[index].complexity,
                duration: favorites[index].duration,
                ingredients: favorites[index].ingredients,
              );
            },
            itemCount: favorites.length,
          );
  }
}
