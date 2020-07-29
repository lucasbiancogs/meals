import 'package:flutter/material.dart';

import '../components/meal_item.dart';
import '../models/meal.dart';
import '../models/category.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final Category _favoriteCategory = const Category(
    id: 'f01',
    title: 'favoriteCategory',
    color: Colors.indigo,
  );

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição favorita'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index], _favoriteCategory);
        },
      );
    }
  }
}
