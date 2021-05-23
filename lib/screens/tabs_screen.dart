import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // List<Widget> _pages = [
  //   CategoriesScreen(),
  //   FavoritesScreen(),
  // ];

  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': "Categories",
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': "Your Favorites",
      },
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
      // drawer: Drawer(
      //   child: Text(
      //     "Drawer",
      //   ),
      // ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text(
              'Categories',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text(
              'Favorites',
            ),
          ),
        ],
      ),
    );
    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: Text("Meals"),
    //         bottom: TabBar(tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favourites',
    //           ),
    //         ]),
    //       ),
    //       body: TabBarView(
    //         children: [
    //           CategoriesScreen(),
    //           FavoritesScreen(),
    //         ],
    //       )),
    // );
  }
}
