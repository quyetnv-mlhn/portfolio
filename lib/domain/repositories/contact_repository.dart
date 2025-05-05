import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/data/repositories/contact_repository_impl.dart';
import 'package:portfolio/domain/models/contact/contact_form_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_repository.g.dart';

@Riverpod(keepAlive: true)
ContactRepository contactRepository(Ref ref) {
  return ContactRepositoryImpl();
}

abstract class ContactRepository {
  Future<bool> submitContactForm(ContactFormData formData);
}
