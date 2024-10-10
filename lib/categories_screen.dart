import 'package:flutter/material.dart';
import 'package:meals_app/const/themes/theme.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: const [
          Text(
            '1',
            style: kTextStyle,
          ),
          Text(
            '2',
            style: kTextStyle,
          ),
          Text(
            '3',
            style: kTextStyle,
          ),
          Text(
            '4',
            style: kTextStyle,
          ),
          Text(
            '5',
            style: kTextStyle,
          ),
          Text(
            '6',
            style: kTextStyle,
          ),
        ],
      ),
    );
  }
}
