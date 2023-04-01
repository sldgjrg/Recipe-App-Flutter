import 'package:flutter/material.dart';

class Recipe {
  final String title;
  final String imagePath;
  final String maker;
  final List<String> ingredients;
  final String instructions;
  final Color? startColor;
  final Color? endColor;

  Recipe({
    required this.title,
    required this.imagePath,
    required this.maker,
    required this.ingredients,
    required this.instructions,
    this.startColor,
    this.endColor,
  });
}

class RecipeDetailArguments {
  static const String routeName = '/recipe-detail';

  final Recipe recipe;

  RecipeDetailArguments({required this.recipe});
}

var recipes = [
  Recipe(
    title: 'Biryani',
    imagePath: 'Chicken-Biryani-Square.jpg',
    maker: 'BabaFoodRRC',
    ingredients: ['Rice', 'Chicken', 'Onion', 'Tomato', 'Spices'],
    instructions:
        '1. Cook the rice.\n2. Fry the chicken.\n3. Mix them together with the spices.',
    startColor: const Color(0xFFF37552),
    endColor: const Color(0xFFF58B5A),
  ),
  Recipe(
    title: 'Chicken Karahi',
    imagePath: 'chicken-karahi.jpg',
    maker: 'BabaFoodRRC',
    ingredients: ['Chicken', 'Tomato', 'Onion', 'Spices'],
    instructions:
        '1. Fry the chicken.\n2. Mix it with the tomato, onion, and spices.\n3. Cook until done.',
    startColor: const Color(0xFF621e14),
    endColor: const Color(0xFFd13b10),
  ),
  Recipe(
    title: 'Haleem',
    imagePath: 'Haleem.jpg',
    maker: 'BabaFoodRRC',
    ingredients: ['Lentils', 'Wheat', 'Meat', 'Onion', 'Spices'],
    instructions:
        '1. Boil the lentils and wheat.\n2. Fry the meat and onion.\n3. Mix everything together with the spices.\n4. Cook until it becomes a thick paste.',
    startColor: const Color(0xFFe18b41),
    endColor: const Color(0xFFc7c73d),
  ),
  Recipe(
    title: 'Nihari',
    imagePath: 'Nihari.jpg',
    maker: 'BabaFoodRRC',
    ingredients: ['Beef', 'Flour', 'Spices'],
    instructions:
        '1. Fry the beef.\n2. Mix the flour with water to make a paste.\n3. Mix the paste with the beef and spices.\n4. Cook until done.',
    startColor: const Color(0xFFaf781d),
    endColor: const Color(0xFFd6a651),
  ),
];
