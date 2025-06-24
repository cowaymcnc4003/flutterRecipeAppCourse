// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_recipe_app_course/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class ErrorMockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const ErrorMockRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipe(int id) async {
    final recipes = await getRecipes();
    return recipes.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    throw Exception('인터넷 문제');
    // final recipes = await _recipeDataSource.getRecipes();
    // return recipes.map((e) => Recipe.fromJson(e)).toList();
  }
}
