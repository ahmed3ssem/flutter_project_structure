import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'bloc_observer.dart';
import 'config/PrefHelper/helper.dart';
import 'config/PrefHelper/prefs.dart';
import 'config/theme/theme_cubit.dart';
import 'core/preferences/flutter_secure_storage.dart';
import 'core/utils/error_handler.dart';
import 'core/utils/local_strings.dart';
import 'injection_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup global framework error handling
  ErrorHandler.init();

  // Initialize storage & dependency injection
  await Prefs.init();
  await di.init();
  await MySecureStorage.clearSecureStorageOnReinstall();

  // Initialize localization
  await FlutterLocalization.instance.ensureInitialized();
  FlutterLocalization.instance.init(
    mapLocales: [
      const MapLocale('en', enStrings, countryCode: 'US'),
      const MapLocale('ar', arStrings, countryCode: 'SA'),
    ],
    initLanguageCode: 'ar',
  );

  await Helper.getDefaultLanguage();
  await initializeDateFormatting('en', null);

  // Global Bloc observer for logging state transitions
  Bloc.observer = AppBlocObserver();

  runApp(
    BlocProvider<ThemeCubit>(
      create: (_) => di.sl<ThemeCubit>(),
      child: const MyApp(),
    ),
  );
}
