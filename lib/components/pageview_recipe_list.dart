import 'package:flutter/material.dart';
import 'package:flutter_tasty/components/recipe_card.dart';
import 'package:flutter_tasty/models/recipe.dart';
import 'package:flutter_tasty/components/recipe_detail.dart';

class PageViewRecipeList extends StatefulWidget {
  final List<Recipe> recipes;
  final Null Function(dynamic recipe) onRecipeTap;

  const PageViewRecipeList({
    Key? key,
    required this.recipes,
    required this.onRecipeTap,
  }) : super(key: key);

  @override
  State<PageViewRecipeList> createState() => _PageViewRecipeListState();
}

class _PageViewRecipeListState extends State<PageViewRecipeList> {
  final PageController pageController = PageController(viewportFraction: 0.75);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 401,
      child: PageView.builder(
        padEnds: false,
        controller: pageController,
        itemCount: widget.recipes.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          bool active = index == currentPage;
          return GestureDetector(
            onTap: () {
              widget.onRecipeTap(widget.recipes[index]);
            },
            child: Opacity(
              opacity: currentPage == index ? 1.0 : 0.5,
              child: RecipeCard(
                active: active,
                index: index,
                recipe: widget.recipes[index],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      int position = pageController.page!.round();
      if (currentPage != position) {
        {
          setState(() {
            currentPage = position;
          });
        }
      }
    });
  }
}
