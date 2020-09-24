import 'package:flutter/material.dart';
import '../widgets/category_meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(routeArgs['title'])),
      body: Center(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          var categoryMealsItem = categoryMeals[index];
          return CategoryMealItem(
              id: categoryMealsItem.id,
              title: categoryMealsItem.title,
              imageURL: categoryMealsItem.imageUrl,
              duration: categoryMealsItem.duration,
              complexity: categoryMealsItem.complexity,
              affordability: categoryMealsItem.affordability);
        },
        itemCount: categoryMeals.length,
      )),
    );
  }
}
