import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
class CategoriesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      // scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES.map((category) {
            return categoryItem(category);
          }).toList(),
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount:2,
        //   childAspectRatio: 3/2,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 20,
        // )
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20
        )
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 30.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[
        //       Item(Category(id: '1', title: 'Chinese', color: Colors.red)),
        //       Item(Category(id: '2', title: 'Indian', color: Colors.blue)),
        //     ],
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[
        //     Item(Category(id: '3', title: 'Italian', color: Colors.green)),
        //     Item(Category(id: '4', title: 'Thai', color: Colors.orange))
        //   ],
        // )
        );
  }
}
