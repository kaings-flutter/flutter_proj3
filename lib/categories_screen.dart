import 'package:flutter/material.dart';
import './category_item.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(cat.title, cat.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20));
  }
}