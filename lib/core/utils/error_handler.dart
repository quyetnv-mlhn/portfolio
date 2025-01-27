import 'package:easy_localization/easy_localization.dart';

import 'package:portfolio/core/utils/logging_utils.dart';
import 'package:portfolio/core/utils/snackbar_handler.dart';

void handleError(dynamic error, StackTrace stackTrace) {
  LoggerUtils.e(error, stackTrace: stackTrace);
  SnackBarHandler.showError(error.toString().tr());
}
