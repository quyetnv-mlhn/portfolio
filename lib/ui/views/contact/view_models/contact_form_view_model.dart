import 'package:flutter/material.dart';
import 'package:portfolio/domain/models/contact/contact_form_data.dart';
import 'package:portfolio/domain/repositories/contact_repository.dart';
import 'package:portfolio/ui/views/contact/state/contact_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_form_view_model.g.dart';

@riverpod
class ContactFormViewModel extends _$ContactFormViewModel {
  late final nameController = TextEditingController();
  late final emailController = TextEditingController();
  late final phoneController = TextEditingController();
  late final messageController = TextEditingController();

  @override
  ContactFormState build() {
    ref.onDispose(() {
      nameController.dispose();
      emailController.dispose();
      phoneController.dispose();
      messageController.dispose();
    });
    return const ContactFormState();
  }

  Future<void> submitForm(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return;

    state = state.copyWith(isLoading: true, isSuccess: false, isError: false);

    try {
      final repository = ref.read(contactRepositoryProvider);
      final success = await repository.submitContactForm(
        ContactFormData(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          message: messageController.text,
        ),
      );

      state = state.copyWith(
        isLoading: false,
        isSuccess: success,
        isError: !success,
      );

      if (success) {
        nameController.clear();
        emailController.clear();
        phoneController.clear();
        messageController.clear();
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, isSuccess: false, isError: true);
    }
  }

  bool get isLoading => state.isLoading;
}
