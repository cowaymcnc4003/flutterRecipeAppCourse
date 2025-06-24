import 'package:freezed_annotation/freezed_annotation.dart';
import 'error.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<D, E extends Error> with _$Result<D, E> {
  factory Result.success(D data) = ResultSuccess;
  factory Result.error(E error) = ResultError;
}
