import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favouriteMeals = [];

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _showSnackMessage(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message),
      ),
    );
  }

  void _onToggleFavouriteStatus(Meal meal) {
    final isAFavourite = favouriteMeals.contains(meal);
    if (isAFavourite) {
      setState(() {
        favouriteMeals.remove(meal);
        _showSnackMessage(
          'Favourite removed!',
          Theme.of(context).colorScheme.error,
        );
      });
    } else {
      setState(() {
        favouriteMeals.add(meal);
        _showSnackMessage(
          'Favourite added!',
          Theme.of(context).colorScheme.primary,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavouriteStatus: _onToggleFavouriteStatus,
    );
    String activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(
        onToggleFavouriteStatus: (meal) => _onToggleFavouriteStatus(meal),
        title: null,
        meals: favouriteMeals,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
