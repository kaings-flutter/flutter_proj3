import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> filterOptions = {
    '_glutenFree': false,
    '_vegetarian': false,
    '_vegan': false,
    '_lactoseFree': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters Screen'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          // `Expanded` will take the whole remaining space
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  subtitle: Text('Only include gluten-free meals.'),
                  value: filterOptions['_glutenFree'],
                  onChanged: (newValue) {
                    setState(() {
                      filterOptions['_glutenFree'] = newValue;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
