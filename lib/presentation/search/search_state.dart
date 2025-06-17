import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';
part 'search_state.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class SearchState with _$SearchState {
  final List<Recipe> recipes;
  final bool isLoading;
  final String searchTitle;
  final String resultsCount;
  const SearchState({
    this.recipes = const [],
    this.isLoading = false,
    this.searchTitle = 'Recent Search',
    this.resultsCount = '',
  });

  factory SearchState.fromJson(Map<String, dynamic> json) =>
      _$SearchStateFromJson(json);
  Map<String, dynamic> toJson() => _$SearchStateToJson(this);
}
