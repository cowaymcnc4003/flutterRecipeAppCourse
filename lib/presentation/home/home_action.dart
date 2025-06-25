import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction<T> with _$HomeAction {
  factory HomeAction.onTapSearchFiled() = OnTapSearchFiled;
  factory HomeAction.onSelectCategory(String category) = OnSelectCategory;
  factory HomeAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
}
