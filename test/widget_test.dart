import 'package:flutter_project_structure/core/error/failures.dart';
import 'package:flutter_project_structure/core/utils/app_constant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Core Architecture Smoke Tests', () {
    test('ServerFailure props equality check', () {
      const failure1 = ServerFailure(msg: 'Server error', statusCode: 500);
      const failure2 = ServerFailure(msg: 'Server error', statusCode: 500);
      const failure3 = ServerFailure(msg: 'Not found', statusCode: 404);

      expect(failure1, equals(failure2));
      expect(failure1, isNot(equals(failure3)));
    });

    test('AppConstants values are well-configured', () {
      expect(AppConstants.buttonHeight, greaterThan(40));
      expect(AppConstants.currentVersion, isNotEmpty);
    });
  });
}
