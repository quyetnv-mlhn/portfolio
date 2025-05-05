import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/contact/contact_form_data.dart';
import 'package:portfolio/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  String get _formspreeEndpoint => dotenv.env['FORMSPREE_ENDPOINT'] ?? '';

  @override
  Future<bool> submitContactForm(ContactFormData formData) async {
    try {
      final uri = Uri.parse(_formspreeEndpoint);
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(formData.toJson()),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
