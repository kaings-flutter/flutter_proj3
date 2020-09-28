import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilterOptions;
  final Function saveFilters;

  FiltersScreen(this.currentFilterOptions, this.saveFilters);

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
  initState() {
    filterOptions = widget.currentFilterOptions;
    super.initState();
  }

  Widget buildSwitchListTile(String _title, String _subtitle,
      bool _currentValue, Function _updateValue) {
    return SwitchListTile(
      title: Text(_title),
      subtitle: Text(_subtitle),
      value: _currentValue,
      onChanged: _updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters Screen'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              // `saveFilters` function are part of widget! Not State
              onPressed: () {
                widget.saveFilters(filterOptions);
              }),
        ],
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
                buildSwitchListTile(
                    'Gluten-Free',
                    'Only include gluten-free meals.',
                    filterOptions['_glutenFree'], (newValue) {
                  setState(() {
                    filterOptions['_glutenFree'] = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-Free',
                    'Only include lactose-free meals.',
                    filterOptions['_lactoseFree'], (newValue) {
                  setState(() {
                    filterOptions['_lactoseFree'] = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    filterOptions['_vegetarian'], (newValue) {
                  setState(() {
                    filterOptions['_vegetarian'] = newValue;
                  });
                }),
                buildSwitchListTile('Vegan', 'Only include vegan meals.',
                    filterOptions['_vegan'], (newValue) {
                  setState(() {
                    filterOptions['_vegan'] = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
