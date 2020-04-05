import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class MealsPage extends StatefulWidget {
  static const namedRoute = 'category-meals';
  final List<Meal> availableMeals;
  MealsPage(this.availableMeals);
  @override
  _MealsPageState createState() => _MealsPageState();
}
class _MealsPageState extends State<MealsPage> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadedInitData=false;
  @override
  // void initState() {
  //   //... ModalRoute.of(context) 
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
    final Map<String, String> routeArguments =
        ModalRoute.of(context).settings.arguments;
    categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    
    }).toList(); 
    _loadedInitData=true;
  }
  super.didChangeDependencies();
  }
  void _removeItem(String id){
      setState(() {
         categoryMeals.removeWhere((meal)=>meal.id==id);
      });
     
      
    }
  @override
  // final String id;
  // final String title;
  // MealsPage({this.id,this.title});
  Widget build(BuildContext context) {    
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return mealItem(
              id:categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              ingredients: categoryMeals[index].ingredients,
              removeItem: _removeItem
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
