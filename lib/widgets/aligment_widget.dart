import 'package:flutter/material.dart';
import 'package:flutter_project_structure/config/PrefHelper/helper.dart';
import 'package:flutter_project_structure/core/utils/app_strings.dart';

abstract class AlignmentType {
  Alignment returnAlignment();
}

/// Helper for directional alignment based on active locale.
///
/// NOTE: In Flutter widgets, prefer using [AlignmentDirectional.topStart] or
/// [EdgeInsetsDirectional] directly, as they automatically respect LTR and RTL.
class AlignmentWidget extends AlignmentType {
  @override
  Alignment returnAlignment() {
    if (Helper.getCurrentLocal() == AppStrings.arCountryCode) {
      return Alignment.topRight;
    } else {
      return Alignment.topLeft;
    }
  }

  static AlignmentDirectional get topStart => AlignmentDirectional.topStart;
  static AlignmentDirectional get topEnd => AlignmentDirectional.topEnd;
  static AlignmentDirectional get centerStart => AlignmentDirectional.centerStart;
  static AlignmentDirectional get centerEnd => AlignmentDirectional.centerEnd;
}
