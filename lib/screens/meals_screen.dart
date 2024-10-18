import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavouriteStatus});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavouriteStatus;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
              meal: meal,
              onToogleFavouriteStatus: onToggleFavouriteStatus,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... no meals found!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting another category!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) => selectMeal(
            context,
            meals[index],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: (title != null)
          ? AppBar(
              title: Text(title!),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: content,
      ),
    );
  }
}
