import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_form_data.freezed.dart';
part 'contact_form_data.g.dart';

@freezed
abstract class ContactFormData with _$ContactFormData {
  const factory ContactFormData({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) = _ContactFormData;

  factory ContactFormData.fromJson(Map<String, dynamic> json) =>
      _$ContactFormDataFromJson(json);
}
