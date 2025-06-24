import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class HomeState with _$HomeState {
  final String selectedCategory;
  final List<String> categorys;
  final List<Recipe> dishes;
  final List<Recipe> newRecipes;

  const HomeState({
    this.selectedCategory = 'All',
    this.categorys = const [],
    this.dishes = const [],
    this.newRecipes = const [],
  });

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStateToJson(this);
}
