import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/configs/app_sizes.dart';
import 'package:portfolio/core/enums/screen_type.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/views/contact/state/contact_form_state.dart';
import 'package:portfolio/ui/views/contact/view_models/contact_form_view_model.dart';

class ContactForm extends ConsumerStatefulWidget {
  final ScreenType screenType;
  const ContactForm({super.key, required this.screenType});

  @override
  ConsumerState<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends ConsumerState<ContactForm> {
  late final _viewModel = ref.read(contactFormViewModelProvider.notifier);
  late final _nameCtrl = _viewModel.nameController;
  late final _emailCtrl = _viewModel.emailController;
  late final _phoneCtrl = _viewModel.phoneController;
  late final _msgCtrl = _viewModel.messageController;
  late final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _setupStateListener();
  }

  void _setupStateListener() {
    ref.listenManual(contactFormViewModelProvider, (previous, next) {
      if (next.isSuccess) {
        SnackBarHandler.showSuccess(LocaleKeys.contact_success.tr());
      } else if (next.isError) {
        SnackBarHandler.showError(LocaleKeys.contact_error.tr());
      }
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.contact_email_required.tr();
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.contact_email_invalid.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final state = ref.watch(contactFormViewModelProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildResponsiveFields(theme, textColor),
          const SizedBox(height: spacingL),
          _buildNameField(theme, textColor),
          const SizedBox(height: spacingL),
          _buildMessageField(theme, textColor),
          const SizedBox(height: spacingXL),
          _buildSubmitButton(theme, state),
        ],
      ),
    );
  }

  Widget _buildNameField(ThemeData theme, Color textColor) {
    return _buildLabeledField(
      theme,
      textColor,
      LocaleKeys.contact_name.tr(),
      _buildTextField(
        controller: _nameCtrl,
        theme: theme,
        hint: LocaleKeys.contact_name_hint.tr(),
        validator: _requiredValidator(LocaleKeys.contact_name_required.tr()),
      ),
    );
  }

  Widget _buildMessageField(ThemeData theme, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.contact_message.tr(),
          style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
        ),
        const SizedBox(height: spacingXS),
        _buildTextField(
          controller: _msgCtrl,
          theme: theme,
          hint: LocaleKeys.contact_message_hint.tr(),
          maxLines: 5,
          validator: _requiredValidator(
            LocaleKeys.contact_message_required.tr(),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(ThemeData theme, ContactFormState state) {
    return Center(
      child: ElevatedButton(
        onPressed:
            state.isLoading ? null : () => _viewModel.submitForm(_formKey),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingXXL,
            vertical: spacingM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusM),
          ),
        ),
        child:
            state.isLoading
                ? const CircularProgressIndicator()
                : Text(
                  LocaleKeys.contact_submit.tr(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
      ),
    );
  }

  Widget _buildResponsiveFields(ThemeData theme, Color textColor) {
    final emailField = _buildLabeledField(
      theme,
      textColor,
      LocaleKeys.contact_email.tr(),
      _buildTextField(
        controller: _emailCtrl,
        theme: theme,
        hint: LocaleKeys.contact_email_hint.tr(),
        validator: _validateEmail,
      ),
    );

    final phoneField = _buildLabeledField(
      theme,
      textColor,
      LocaleKeys.contact_phone.tr(),
      _buildTextField(
        controller: _phoneCtrl,
        theme: theme,
        hint: LocaleKeys.contact_phone_hint.tr(),
        validator: _requiredValidator(LocaleKeys.contact_phone_required.tr()),
      ),
    );

    return widget.screenType.isDesktop
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: emailField),
            const SizedBox(width: spacingL),
            Expanded(child: phoneField),
          ],
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [emailField, const SizedBox(height: spacingL), phoneField],
        );
  }

  Widget _buildLabeledField(
    ThemeData theme,
    Color textColor,
    String label,
    Widget field,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
            ),
            Text(
              ' (*)',
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: spacingXS),
        field,
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required ThemeData theme,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusS),
          borderSide: BorderSide(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          ),
        ),
      ),
      validator: validator,
    );
  }

  String? Function(String?) _requiredValidator(String errorMsg) {
    return (value) => (value == null || value.isEmpty) ? errorMsg : null;
  }
}
