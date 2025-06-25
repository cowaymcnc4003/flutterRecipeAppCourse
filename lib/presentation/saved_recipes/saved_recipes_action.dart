import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  factory SavedRecipesAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
  factory SavedRecipesAction.onTapRecipe(Recipe recipe) = OnTapRecipe;
}
