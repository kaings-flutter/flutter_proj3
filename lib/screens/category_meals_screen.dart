import 'package:flutter/material.dart';
import '../widgets/category_meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  Map<String, String> routeArgs;

  // we could not place ModalRoute in initState because context is not ready
  @override
  void initState() {
    super.initState();
  }

  // didChangeDependencies will trigger everytime the reference of the state changes
  // at this life-cycle hook, context is available
  @override
  void didChangeDependencies() {
    routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs['id']);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      print('value triggered..... $mealId');
      displayedMeals.removeWhere(
          (meal) => meal.id == mealId); // removeWhere is mutable method
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(routeArgs['title'])),
      body: Center(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          var categoryMealsItem = displayedMeals[index];
          return CategoryMealItem(
            id: categoryMealsItem.id,
            title: categoryMealsItem.title,
            imageURL: categoryMealsItem.imageUrl,
            duration: categoryMealsItem.duration,
            complexity: categoryMealsItem.complexity,
            affordability: categoryMealsItem.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      )),
    );
  }
}
