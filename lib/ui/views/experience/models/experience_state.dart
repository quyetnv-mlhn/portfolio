import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/domain/models/experience/experience_data.dart';

part 'experience_state.freezed.dart';

@freezed
abstract class ExperienceState with _$ExperienceState {
  const factory ExperienceState({
    ExperienceData? data,
    @Default(false) bool isLoading,
    String? error,
  }) = _ExperienceState;
}
