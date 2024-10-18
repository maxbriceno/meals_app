import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavouriteStatus});
  final void Function(Meal meal) onToggleFavouriteStatus;

  void _onSelectCategory(
    BuildContext context,
    Category category,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          onToggleFavouriteStatus: onToggleFavouriteStatus,
          title: category.title,
          meals: _filterMealsByCategory(category),
        ),
      ),
    );
  }

  _filterMealsByCategory(Category category) {
    return dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        for (var category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => _onSelectCategory(context, category),
          )
      ],
    );
  }
}
