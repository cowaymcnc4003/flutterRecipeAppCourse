import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_state.freezed.dart';
part 'saved_recipes_state.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class SavedRecipesState with _$SavedRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;
  SavedRecipesState({
    this.recipes = const [],
    this.isLoading = false,
  });

  factory SavedRecipesState.fromJson(Map<String, dynamic> json) =>
      _$SavedRecipesStateFromJson(json);
  Map<String, dynamic> toJson() => _$SavedRecipesStateToJson(this);
}
