import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  factory IngredientAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
  factory IngredientAction.onTapIngredient() = OnTapIngredient;
  factory IngredientAction.onTapProcedure() = OnTapProcedure;
  factory IngredientAction.onTapFollow(Recipe recipe) = OnTapFollow;
  factory IngredientAction.loadRecipe(int recipeId) = LoadRecipe;
}
