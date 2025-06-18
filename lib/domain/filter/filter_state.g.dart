// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterState _$FilterStateFromJson(Map<String, dynamic> json) => FilterState(
      time: json['time'] as String,
      rate: (json['rate'] as num).toInt(),
      category: json['category'] as String,
    );

Map<String, dynamic> _$FilterStateToJson(FilterState instance) =>
    <String, dynamic>{
      'time': instance.time,
      'rate': instance.rate,
      'category': instance.category,
    };
