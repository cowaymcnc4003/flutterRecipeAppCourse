// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchState _$SearchStateFromJson(Map<String, dynamic> json) => SearchState(
      recipes: (json['recipes'] as List<dynamic>?)
              ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
      searchTitle: json['searchTitle'] as String? ?? 'Recent Search',
      resultsCount: json['resultsCount'] as String? ?? '',
      filterState: json['filterState'] == null
          ? const FilterState(time: 'All', rate: 1, category: 'All')
          : FilterState.fromJson(json['filterState'] as Map<String, dynamic>),
      query: json['query'] as String? ?? '',
    );

Map<String, dynamic> _$SearchStateToJson(SearchState instance) =>
    <String, dynamic>{
      'recipes': instance.recipes,
      'isLoading': instance.isLoading,
      'searchTitle': instance.searchTitle,
      'resultsCount': instance.resultsCount,
      'filterState': instance.filterState,
      'query': instance.query,
    };
