import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'bloc_observer.dart';
import 'config/PrefHelper/prefs.dart';
import 'config/PrefHelper/helper.dart';
import 'config/theme/theme_cubit.dart';
import 'injection_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  await di.init();

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
