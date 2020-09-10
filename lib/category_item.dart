import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
          15), // this will improve performance. `const` will inform flutter not to rerender because it is const (won't change)
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color.withOpacity(0.7), color]),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
