// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_recipe_app_course/data/data_source/local_storage.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/recent_search_recipe_repository.dart';

class MockRecentSearchRepositoryImpl implements RecentSearchRecipeRepository {
  final LocalStorage _localStorage;

  const MockRecentSearchRepositoryImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    try {
      final json = await _localStorage.load();
      return (json['recipes'] as Iterable)
          .map((e) => Recipe.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) async {
    await _localStorage.save({
      'recipes': recipes.map((e) => e.toJson()),
    });
  }
}
