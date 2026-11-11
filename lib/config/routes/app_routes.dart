import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Routes {
  static const String initialRoutes = '/';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(builder: (context) {
          //return const SplashScreen();
          return SizedBox();
        });
      default:
        return unDefinedRoute(routeSettings.name);
    }
  }

  static Route<dynamic> unDefinedRoute([String? routeName]) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: Center(
          child: Text(
            'Route "${routeName ?? 'unknown'}" not defined',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
