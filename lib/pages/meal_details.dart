import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsPage extends StatelessWidget {
  static const namedRoute = '/meal-details';
  final Function toggleFavorites;
  final Function isFavorite;
  MealDetailsPage(this.toggleFavorites,this.isFavorite);
  Widget buildSectionTitle(ctx, text) {
    return Text(
      text,
      style: Theme.of(ctx)
          .textTheme
          .title
          .copyWith(color: Theme.of(ctx).primaryColor, fontSize: 26),
    );
  }

  Widget buildContainer(child) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: 170,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: buildSectionTitle(context, 'Ingredients'),
            ),
            Column(
              children: [
                buildContainer(
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10),
                          child: Text(
                            selectedMeal.ingredients[index],
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(color: Colors.black87, fontSize: 18),
                          ),
                        ),
                      );
                    },
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: buildSectionTitle(context, 'Steps'),
                ),
                buildContainer(ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '#${index + 1}',
                              style: TextStyle(fontSize: 20),
                            ),
                            radius: 25.0,
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ))
                // ...ingredients.map((ingredient) {
                //   return Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5),
                //       color: Theme.of(context).accentColor,
                //     ),
                //     width: double.infinity,
                //     padding: EdgeInsets.all(5),
                //     margin: EdgeInsets.all(5),
                //     child: Text(
                //       ingredient,
                //       style: Theme.of(context)
                //           .textTheme
                //           .title
                //           .copyWith(color: Colors.black54),
                //     ),
                //   );
                // }).toList()
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>toggleFavorites(selectedMeal.id),
        child: Icon(isFavorite(selectedMeal.id)?Icons.star:Icons.star_border)
      )
    );
  }
}
