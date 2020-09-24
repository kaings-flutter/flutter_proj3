import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreenTop extends StatefulWidget {
  @override
  _TabsScreenTopState createState() => _TabsScreenTopState();
}

class _TabsScreenTopState extends State<TabsScreenTop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        // initialIndex: 1, // in case you want to modify which tab is displayed as default
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ]),
          ),
          body: TabBarView(
              children: <Widget>[CategoriesScreen(), FavoritesScreen()]),
        ));
  }
}
