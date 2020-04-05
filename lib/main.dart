import 'package:flutter/material.dart';
import './pages/Meals.dart';
import './pages/filters.dart';
import './pages/meal_details.dart';
import './pages/tabs_screen.dart';
import './models/meals.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 List<Meal> favorites=[];
 List<Meal> _availableMeals=DUMMY_MEALS;
 Map<String,bool>_currentFilters={
   'gluten':false,
   'lactose':false,
   'vegan':false,
   'vegetarian':false
 };
 void _toggleFavorites(String mealId){
  if(favorites.indexWhere((meal)=>meal.id==mealId)>=0){
    setState(() {
       favorites.removeWhere((meal)=>meal.id==mealId);
    });
  }
  else{
    setState(() {
      favorites.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
    });
  }
 }
 bool _isFavorite(String mealId){
   return favorites.any((meal)=>meal.id==mealId);
 }
 void _saveFilters(Map<String,bool> filters){
       setState(() {
         _currentFilters=filters;
         _availableMeals= DUMMY_MEALS.where((meal){
        if (_currentFilters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_currentFilters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_currentFilters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_currentFilters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
   }).toList();
       });
    
 }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: HomePage(),
      initialRoute: '/',//Default is '/'
      routes: {
        '/': (context) =>TabsScreen(favorites),
        MealsPage.namedRoute: (context) {
          //We provide the builder function
          return MealsPage(_availableMeals);
        },
        MealDetailsPage.namedRoute:(context){
            return MealDetailsPage(_toggleFavorites,_isFavorite);
        },
        FiltersPage.namedRoute:(context){
          return FiltersPage(_saveFilters,_currentFilters);
        }
      },
    );
  }
}

