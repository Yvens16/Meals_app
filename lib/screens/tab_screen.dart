import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../screens/favorites_screens.dart';
import '../screens/categories_screen.dart';
import '../widgets/main_drawer.dart';

class TabsSCreen extends StatefulWidget {
  List<Meal> favoritesMeals;
  TabsSCreen(this.favoritesMeals);
  _TabsSCreenState createState() => _TabsSCreenState();
}

class _TabsSCreenState extends State<TabsSCreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

@override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(widget.favoritesMeals), 'title': 'Your favorite'},
  ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        // selectedFontSize: ,
        // unselectedFontSize: ,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}

// HOW TO CREATE A TAB BAR AT THE TOP OF THE APPLICATION
// return DefaultTabController(
//   length: 2,
//   // initialIndex: 0, Default index doesn't need to be configured
//   child: Scaffold(
//     appBar: AppBar(
//       title: Text('Meals'),
//       bottom: TabBar(
//         tabs: <Widget>[
//           Tab(
//             icon: Icon(Icons.category),
//             text: 'Categories',
//           ),
//           Tab(
//             icon: Icon(Icons.star),
//             text: 'Favorites',
//           ),
//         ],
//       ),
//     ),
//     body: TabBarView(
//       children: <Widget>[
//         CategoriesScreen(),
//         FavoriteScreen(),
//       ],
//     ),
//   ),
// );
