// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_recipe_app_course/domain/model/ingredient.dart';
import 'package:flutter_recipe_app_course/domain/model/procedure.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';

part 'ingredient_state.freezed.dart';
part 'ingredient_state.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class IngredientState with _$IngredientState {
  List<Ingredient> ingredients;
  List<Procedure> procedures;
  Recipe? recipe;
  int selectedTabIndex;

  IngredientState({
    this.ingredients = const [],
    this.procedures = const [],
    this.recipe,
    this.selectedTabIndex = 0,
  });

  factory IngredientState.fromJson(Map<String, dynamic> json) =>
      _$IngredientStateFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientStateToJson(this);
}
