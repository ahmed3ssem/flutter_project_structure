import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/local_strings.dart';

class Routes {
  static const String initialRoutes = '/';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text(
                  'noData'.tr,
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            );
          },
        );
      default:
        return null;
    }
  }
}
