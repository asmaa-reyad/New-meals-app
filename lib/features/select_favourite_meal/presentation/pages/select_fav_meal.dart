import 'package:flutter/material.dart';
import 'package:meals_app/features/select_favourite_meal/presentation/widgets/select_fav_meal_body.dart';

class SelectFavMeal extends StatelessWidget {
  const SelectFavMeal({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SelectFavMealBody(),
    );
  }
}