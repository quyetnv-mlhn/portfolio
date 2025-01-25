import 'package:easy_localization/easy_localization.dart';

import 'logging_utils.dart';
import 'snackbar_handler.dart';

void handleError(dynamic error, StackTrace stackTrace) {
  LoggerUtils.e(error, stackTrace: stackTrace);
  SnackBarHandler.showError(error.toString().tr());
}
