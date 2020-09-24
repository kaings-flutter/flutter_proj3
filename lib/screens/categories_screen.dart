import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // remove Scaffold here to avoid double AppBar in TabBar
    return GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(cat.id, cat.title, cat.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20));
  }
}
