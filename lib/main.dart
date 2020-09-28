import 'package:flutter/material.dart';
import './models/meal.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen_bottom.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _currentFilterOptions = {
    '_glutenFree': false,
    '_vegetarian': false,
    '_vegan': false,
    '_lactoseFree': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterOptions) {
    setState(() {
      _currentFilterOptions = filterOptions;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_currentFilterOptions['_glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_currentFilterOptions['_vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_currentFilterOptions['_vegan'] && !meal.isVegan) {
          return false;
        }
        if (_currentFilterOptions['_lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      initialRoute: '/', // default route
      routes: {
        '/': (ctx) => TabsScreenBottom(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(_currentFilterOptions, _setFilters),
      },
      // onGenerateRoute will be reached when the navigated route is not found in above routes
      // onGenerateRoute: (settings) {
      // print(settings.arguments);
      // // example.....
      // if(settings.name == '/meal-bla3') {
      //   return MaterialPageRoute(builder: (ctx) => SomeWidgetPage());
      // }
      // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // onUnknownRoute will be reached when all other routes cannot be reached
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
