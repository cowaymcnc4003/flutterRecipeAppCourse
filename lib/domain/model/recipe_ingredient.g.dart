// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeIngredient _$RecipeIngredientFromJson(Map<String, dynamic> json) =>
    RecipeIngredient(
      ingredient:
          Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$RecipeIngredientToJson(RecipeIngredient instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient,
      'amount': instance.amount,
    };
