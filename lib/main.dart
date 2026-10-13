import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'bloc_observer.dart';
import 'config/PrefHelper/prefs.dart';
import 'config/PrefHelper/helper.dart';
import 'config/theme/theme_cubit.dart';
import 'core/utils/local_strings.dart';
import 'injection_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  await di.init();

  FlutterLocalization.instance.init(
    mapLocales: [
      const MapLocale('ar', AppLocale.AR, countryCode: 'AR'),
      const MapLocale('en', AppLocale.EN, countryCode: 'US'),
    ],
    initLanguageCode: 'ar',
  );

  // Initialize locale before running the app
  await Helper.getDefaultLanguage();
  await initializeDateFormatting('ar', null);
  Bloc.observer = AppBlocObserver();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => BlocProvider<ThemeCubit>(
        create: (_) => di.sl<ThemeCubit>(),
        child: const MyApp(),
      ),
    ),
  );
}
