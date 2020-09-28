import 'package:flutter/material.dart';
import '../widgets/category_meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  Map<String, String> routeArgs;
  bool _mealLoaded = false;

  // we could not place ModalRoute in initState because context is not ready
  @override
  void initState() {
    super.initState();
  }

  // didChangeDependencies will trigger everytime the reference of the state changes
  // at this life-cycle hook, context is available
  @override
  void didChangeDependencies() {
    // you need to do checking like this because
    // didChangeDependencies triggers everytime there is state changes (e.g.: when you remove meal)
    if (!_mealLoaded) {
      routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();

      _mealLoaded = true;
    }

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
