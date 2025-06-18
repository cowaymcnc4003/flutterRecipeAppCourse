import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class HomeState with _$HomeState {
  final String selectedCategory;
  final List<String> categorys;

  const HomeState({
    this.selectedCategory = 'All',
    this.categorys = const [],
  });

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
  Map<String, dynamic> toJson() => _$HomeStateToJson(this);
}
