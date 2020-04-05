import 'package:flutter/material.dart';
import '../pages/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(BuildContext context, IconData icon,String text, Function page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: Theme.of(context).textTheme.title.copyWith(fontSize: 24),
      ),
      onTap: page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            alignment: Alignment.centerLeft,
            child: ListTile(
              title: Text(
                'COOKING UP!',
                style: Theme.of(context).textTheme.title.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor,
                    fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            context,
            Icons.local_dining,
            'Meals',
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            context,
            Icons.settings,
            'Filters',
            () {
              Navigator.of(context).pushReplacementNamed(FiltersPage.namedRoute);
            },
          )
        ],
      ),
    );
  }
}
