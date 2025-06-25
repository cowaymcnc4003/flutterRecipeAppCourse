// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientState _$IngredientStateFromJson(Map<String, dynamic> json) =>
    IngredientState(
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      procedures: (json['procedures'] as List<dynamic>?)
              ?.map((e) => Procedure.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recipe: json['recipe'] == null
          ? null
          : Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      selectedTabIndex: (json['selectedTabIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$IngredientStateToJson(IngredientState instance) =>
    <String, dynamic>{
      'ingredients': instance.ingredients,
      'procedures': instance.procedures,
      'recipe': instance.recipe,
      'selectedTabIndex': instance.selectedTabIndex,
    };
