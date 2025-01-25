import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/provider_observer.dart';
import '../core/enums/environment_enum.dart';
import '../core/enums/locale_enum.dart';
import '../core/utils/logging_utils.dart';
import '../core/utils/snackbar_handler.dart';
import '../gen/assets.gen.dart';
import '../gen/codegen_loader.g.dart';

Future<void> mainCommon({
  required Environment env,
  required String envFilePath,
  required Widget child,
}) async {
  runZonedGuarded(
    () async {
      // final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await dotenv.load(fileName: Assets.env.aEnvDev);

      // Initialize localization
      await _initializeLocalization();

      // Run the app
      runApp(
        EasyLocalization(
          supportedLocales: LocaleEnum.values.map((e) => e.locale).toList(),
          path: 'assets/translations',
          fallbackLocale: LocaleEnum.en.locale,
          startLocale: LocaleEnum.en.locale,
          assetLoader: const CodegenLoader(),
          child: ProviderScope(
            observers: [MyObserver(maxWidth: 180)],
            child: child,
          ),
        ),
      );
    },
    _handleError,
  );
}

// Function to initialize localization
Future<void> _initializeLocalization() async {
  await _initialize(() async {
    await EasyLocalization.ensureInitialized();
    initSnackbar();
  });
}

// Generic initialization function with error handling
Future<void> _initialize(Future<void> Function() initFunction) async {
  try {
    await initFunction();
  } catch (error, stack) {
    LoggerUtils.e(error, stackTrace: stack);
    runApp(ErrorScreen(error: error.toString(), stackTrace: stack.toString()));
  }
}

// Initialize Snackbar handler
void initSnackbar() {
  SnackBarHandler.scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}

// Error handling function
void _handleError(Object error, StackTrace stack) {
  LoggerUtils.e(error, stackTrace: stack);
  runApp(ErrorScreen(error: error.toString(), stackTrace: stack.toString()));
}

// Error screen that displays the error message and stack trace
class ErrorScreen extends StatelessWidget {
  final String error;
  final String stackTrace;

  const ErrorScreen({required this.error, required this.stackTrace, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'An error occurred: $error',
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Stack Trace:',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                stackTrace,
                style: const TextStyle(color: Colors.black87, fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
