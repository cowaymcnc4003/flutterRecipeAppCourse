// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/error/bookmark_error.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class ToggleBookmarkRecipeUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  ToggleBookmarkRecipeUseCase({
    required BookmarkRepository bookmarkRepository,
    required RecipeRepository recipeRepository,
  })  : _bookmarkRepository = bookmarkRepository,
        _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, BookmarkError>> execute(int recipeId) async {
    final recipe = await _recipeRepository.getRecipe(recipeId);
    if (recipe == null) {
      return Result.error(BookmarkError.notFound);
    }
    try {
      await _bookmarkRepository.toggle(recipeId);
      final recipes = await _recipeRepository.getRecipes();

      final ids = await _bookmarkRepository.getBookmarkedIds();

      return Result.success(recipes.map((e) {
        if (ids.contains(e.id)) {
          return e.copyWith(isFavorite: true);
        }
        return e;
      }).toList());
    } catch (e) {
      return Result.error(BookmarkError.unknown);
    }
  }
}
