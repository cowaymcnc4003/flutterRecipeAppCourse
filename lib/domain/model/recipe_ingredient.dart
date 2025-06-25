// RecipeIngredient model class
import 'ingredient.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient.freezed.dart';
part 'recipe_ingredient.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class RecipeIngredient with _$RecipeIngredient {
  final Ingredient ingredient;
  final int amount;
  const RecipeIngredient({
    required this.ingredient,
    required this.amount,
  });

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeIngredientToJson(this);
}
