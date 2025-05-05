import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_form_state.freezed.dart';
part 'contact_form_state.g.dart';

@freezed
abstract class ContactFormState with _$ContactFormState {
  const factory ContactFormState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
  }) = _ContactFormState;

  factory ContactFormState.fromJson(Map<String, dynamic> json) =>
      _$ContactFormStateFromJson(json);
}
