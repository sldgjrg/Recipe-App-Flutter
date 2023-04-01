import 'package:flutter/material.dart';
import 'package:flutter_tasty/screens/home_screen.dart';
import 'package:flutter_tasty/components/recipe_detail.dart';

import 'models/recipe.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange,
        ),
      ),
      home: const OnboardingScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/recipe_detail') {
          final value = settings.arguments as Recipe; // Retrieve the value.
          return MaterialPageRoute(
              builder: (_) => RecipeDetailPage(
                  recipe: value)); // Pass it to RecipeDetailPage.
        }
        return null; // Let `onUnknownRoute` handle this behavior.
      },
    );
  }
}
