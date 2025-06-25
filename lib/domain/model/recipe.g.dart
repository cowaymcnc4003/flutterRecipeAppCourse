// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      category: json['category'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      chef: json['chef'] as String,
      time: json['time'] as String,
      rating: (json['rating'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'category': instance.category,
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'chef': instance.chef,
      'time': instance.time,
      'rating': instance.rating,
      'ingredients': instance.ingredients,
      'isFavorite': instance.isFavorite,
    };
