import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/error/bookmark_error.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/toggle_bookmark_recipe_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:flutter_recipe_app_course/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final ToggleBookmarkRecipeUseCase _toggleBookmarkRecipeUseCase;
  StreamSubscription? _streamSubscription;

  SavedRecipesState _state = SavedRecipesState();

  //상태태
  SavedRecipesState get state => _state;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required ToggleBookmarkRecipeUseCase toggleBookmarkRecipeUseCase,
  })  : _getSavedRecipesUseCase = getSavedRecipesUseCase,
        _toggleBookmarkRecipeUseCase = toggleBookmarkRecipeUseCase {
    // _loadRecipeData();
    _streamSubscription = _getSavedRecipesUseCase.execute().listen((recipes) {
      _state = state.copyWith(recipes: recipes);
      // 상태 업데이트
      notifyListeners();
    });
  }

  void _onTapFavorite(int recipeId) async {
    await _toggleBookmarkRecipeUseCase.execute(recipeId);
  }

  void onAction(SavedRecipesAction action) async {
    switch (action) {
      case OnTapFavorite():
        _onTapFavorite(action.recipe.id);
      case OnTapRecipe():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
