import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/widgets/error_widget.dart';

class ErrorHandler {
  static void init() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
    };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ErrorWidgetItem(
            onTap: () {},
            errorMessage: kDebugMode ? details.exceptionAsString() : null,
            showBackButton: false,
          ),
        ),
      );
    };
  }

  // Backwards compatibility alias
  static void handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  }
}
