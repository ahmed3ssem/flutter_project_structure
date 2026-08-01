import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/PrefHelper/helper.dart';
import 'config/routes/app_routes.dart';
import 'config/theme/dark_theme.dart';
import 'config/theme/light_theme.dart';
import 'config/theme/theme_cubit.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/local_strings.dart';
import 'widgets/message_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: GetMaterialApp(
                translations: LocalStrings(),
                locale: Helper.getCurrentLocal() == AppStrings.arCountryCode
                    ? const Locale('ar', 'AR')
                    : const Locale('en', 'US'),
                fallbackLocale: const Locale('ar', 'AR'),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ar', 'AR'),
                  Locale('en', 'US'),
                ],

                theme: LightTheme.theme,
                darkTheme: DarkTheme.theme,
                themeMode: themeMode,

                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                scaffoldMessengerKey: MessageWidget.scaffoldMessengerKey,
              ),
            );
          },
        );
      },
    );
  }
}