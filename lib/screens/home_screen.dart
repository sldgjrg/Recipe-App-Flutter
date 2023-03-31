import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tasty/components/my_bottom_navigation_bar.dart';
import 'package:flutter_tasty/components/pageview_recipe_list.dart';
import 'package:flutter_tasty/components/popular_recipe_list.dart';
import 'package:flutter_tasty/components/recipe_detail.dart';
import 'package:flutter_tasty/models/recipe.dart';

class RecipeDetailArguments {
  final Recipe recipe;
  static const routeName = '/recipe_detail';

  RecipeDetailArguments({required this.recipe});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class MySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Here you can display the search results based on the user's query
    return Center(
      child: Text('Search Results for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Here you can display suggestions for the user's search query
    return Center(
      child: Text('Suggestions for "$query"'),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe7eefb),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RecipeDetailArguments.routeName, // use the named route
                arguments: RecipeDetailArguments(
                  recipe: recipes[0],
                ),
              );
            },
            child: Expanded(
              child: PageViewRecipeList(
                recipes: const [],
                onRecipeTap: (recipe) {},
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RecipeDetailArguments.routeName, // use the named route
                arguments: RecipeDetailArguments(
                  recipe: recipes[1],
                ),
              );
            },
            child: const PopularRecipeList(),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSearch(context: context, delegate: MySearchDelegate());
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
