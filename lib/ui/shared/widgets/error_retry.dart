import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorRetry extends ConsumerWidget {
  final String error;
  final void Function(WidgetRef ref) onRetry;

  const ErrorRetry({required this.error, required this.onRetry, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () => onRetry(ref),
            child: Text(LocaleKeys.common_retry.tr()),
          ),
        ],
      ),
    );
  }
}
