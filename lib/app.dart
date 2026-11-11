import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/dark_theme.dart';
import 'config/theme/light_theme.dart';
import 'config/theme/theme_cubit.dart';
import 'core/utils/app_strings.dart';
import 'main.dart';
import 'widgets/message_widget.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    _localization.onTranslatedLanguage = (locale) {
      if (mounted) {
        setState(() {});
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              supportedLocales: _localization.supportedLocales,
              localizationsDelegates: _localization.localizationsDelegates,

              theme: LightTheme.theme,
              darkTheme: DarkTheme.theme,
              themeMode: themeMode,

              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              onGenerateRoute: AppRoutes.onGenerateRoute,
              scaffoldMessengerKey: MessageWidget.scaffoldMessengerKey,
              builder: (context, widget) {
                // Allows gentle accessibility scaling while preventing severe layout breaks
                final mediaQuery = MediaQuery.of(context);
                return MediaQuery(
                  data: mediaQuery.copyWith(
                    textScaler: mediaQuery.textScaler.clamp(
                      minScaleFactor: 0.85,
                      maxScaleFactor: 1.25,
                    ),
                  ),
                  child: widget ?? const SizedBox.shrink(),
                );
              },
            );
          },
        );
      },
    );
  }
}
