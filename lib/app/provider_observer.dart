import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyObserver extends ProviderObserver {
  // Returns the provider name or its runtime type as a string
  String _providerName(ProviderBase provider) =>
      provider.name ?? provider.runtimeType.toString();

  static const String green = '\x1B[32m';
  static const String red = '\x1B[31m';
  static const String yellow = '\x1B[33m';
  static const String magenta = '\x1B[35m';
  static const String reset = '\x1B[0m';

  final int maxWidth;
  final int maxLine;

  MyObserver({this.maxWidth = 120, this.maxLine = 10});

  void _printLog(String header, Map<String, String> bodyParts) {
    debugPrint('');
    debugPrint(header);

    const String verticalLine = '│';
    const String horizontalLine = '─';

    // Compute max key length for formatting
    final int maxKeyLength = bodyParts.keys.fold<int>(
      0,
      (max, key) => key.length > max ? key.length : max,
    );
    final int prefixWidth = maxKeyLength + 4; // 4 = '├─ ' + ': ' length

    bodyParts.forEach((key, value) {
      final bool isLastKey = key == bodyParts.keys.last;

      // Create prefix for the first line and continuation
      final String firstLinePrefix =
          '${isLastKey ? '└' : '├'}$horizontalLine '
          '${key.padRight(maxKeyLength)}: ';
      final String continuationPrefix =
          (isLastKey ? ' ' : verticalLine) + ' '.padRight(maxKeyLength + 4);

      final int effectiveMaxWidth = maxWidth - prefixWidth;

      // Split the value into lines, respecting the max width
      List<String> lines = _splitLog(value, effectiveMaxWidth);

      // Limit the number of lines and add ellipsis if necessary
      if (lines.length > maxLine) {
        lines = lines.sublist(0, maxLine);
        String lastLine = lines.last;
        if (lastLine.length > 3) {
          lines[maxLine - 1] =
              '${lastLine.substring(0, lastLine.length - 3)}...';
        } else {
          lines[maxLine - 1] = '...';
        }
      }

      // Print the first line
      debugPrint(firstLinePrefix + lines.first);

      // Print continuation lines with the proper prefix
      for (int i = 1; i < lines.length; i++) {
        debugPrint(continuationPrefix + lines[i]);
      }
    });
  }

  // Splits a log message into multiple lines based on the max width
  List<String> _splitLog(String text, int maxWidth) {
    List<String> lines = [];
    String remaining = text;

    while (remaining.isNotEmpty) {
      if (remaining.length <= maxWidth) {
        lines.add(remaining);
        break;
      }

      // Find the nearest space to avoid cutting words
      int endIndex = remaining.substring(0, maxWidth).lastIndexOf(' ');
      if (endIndex == -1) {
        endIndex = maxWidth; // If no space, cut at maxWidth
      }

      lines.add(remaining.substring(0, endIndex).trim());
      remaining = remaining.substring(endIndex).trimLeft();
    }

    return lines;
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _printLog(_colored('🟢 PROVIDER INITIALIZED', green), {
      'Provider': _colored(_providerName(provider), magenta),
      'Value': _colored(value.toString(), yellow),
    });
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _printLog(_colored('🔴 PROVIDER DISPOSED', red), {
      'Provider': _colored(_providerName(provider), magenta),
    });
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (previousValue != newValue) {
      _printLog(_colored('🔄 PROVIDER UPDATED', yellow), {
        'Provider': _colored(_providerName(provider), magenta),
        'Previous': _colored(previousValue.toString(), red),
        'Current': _colored(newValue.toString(), green),
      });
    }
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _printLog(_colored('❌ PROVIDER ERROR', red), {
      'Provider': _colored(_providerName(provider), magenta),
      'Error': _colored(error.toString(), red),
      'Stack trace': '\n${stackTrace.toString()}',
    });
  }

  // Colors text based on platform and environment
  String _colored(String text, String colorCode) {
    if (!kIsWeb && Platform.isAndroid) {
      return '$colorCode$text$reset';
    } else {
      return text;
    }
  }
}
