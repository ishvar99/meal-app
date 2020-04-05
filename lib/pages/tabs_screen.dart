import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './Categories.dart';
import './Favorites.dart';
import '../models/meals.dart';
class TabsScreen extends StatelessWidget {
  final List<Meal>favorites;
  TabsScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                child: Text('Categories'),
                icon: Icon(Icons.category),
              ),
              Tab(
                child: Text('Favorites'),
                icon: Icon(Icons.star),
              )
            ],
          ),
        ),
        drawer:MainDrawer(),
        body: TabBarView(

          children: <Widget>[CategoriesPage(), FavoritesPage(favorites)],
          
        ),
      ),
    );
  }
}
