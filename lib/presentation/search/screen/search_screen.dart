import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/recipe_grid_item.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/search_input_filed.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_state.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;
  final void Function(String query)? onChanged;
  final void Function()? onTapFilter;

  const SearchScreen({
    super.key,
    required this.state,
    this.onChanged,
    this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search recipes', style: TextStyles.mediumTextBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Expanded(
                  child: SearchInputFiled(
                    placeHolder: 'Search Recipe',
                    onChanged: onChanged,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: onTapFilter,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorStyles.primary100),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  state.searchTitle,
                  style: TextStyles.normalTextBold,
                ),
                const Spacer(),
                Text(state.resultsCount,
                    style: TextStyles.smallerTextRegular
                        .copyWith(color: ColorStyles.gray3)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = state.recipes[index];
                        return RecipeGridItem(recipe: recipe);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
