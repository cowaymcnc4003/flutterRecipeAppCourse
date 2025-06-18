// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeState _$HomeStateFromJson(Map<String, dynamic> json) => HomeState(
      selectedCategory: json['selectedCategory'] as String? ?? 'All',
      categorys: (json['categorys'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeStateToJson(HomeState instance) => <String, dynamic>{
      'selectedCategory': instance.selectedCategory,
      'categorys': instance.categorys,
    };
