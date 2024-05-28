import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotfier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotfier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealsIsFavorite = state.contains(meal);

    if (mealsIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotfier, List<Meal>>((ref) {
  return FavoriteMealsNotfier();
});
