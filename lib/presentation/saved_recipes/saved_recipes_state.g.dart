// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipes_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedRecipesState _$SavedRecipesStateFromJson(Map<String, dynamic> json) =>
    SavedRecipesState(
      recipes: (json['recipes'] as List<dynamic>?)
              ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$SavedRecipesStateToJson(SavedRecipesState instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
      'isLoading': instance.isLoading,
    };
