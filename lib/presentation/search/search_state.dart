import 'package:flutter_recipe_app_course/domain/filter/filter_state.dart';
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
  final FilterState filterState;
  final String query;

  const SearchState({
    this.recipes = const [],
    this.isLoading = false,
    this.searchTitle = 'Recent Search',
    this.resultsCount = '',
    this.filterState = const FilterState(
      time: 'All',
      rate: 1,
      category: 'All',
    ),
    this.query = '',
  });

  factory SearchState.fromJson(Map<String, dynamic> json) =>
      _$SearchStateFromJson(json);
  Map<String, dynamic> toJson() => _$SearchStateToJson(this);
}
