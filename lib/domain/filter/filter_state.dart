import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';
part 'filter_state.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class FilterState with _$FilterState {
  final String time;
  final int rate;
  final String category;

  const FilterState({
    required this.time,
    required this.rate,
    required this.category,
  });

  factory FilterState.fromJson(Map<String, dynamic> json) =>
      _$FilterStateFromJson(json);
  Map<String, dynamic> toJson() => _$FilterStateToJson(this);
}
