
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:invitation/app.dart';
import 'package:invitation/features/settings/helpers/cache_helper.dart';
import 'package:is_first_run/is_first_run.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  await CacheHelper.init();

  bool firstRun = await IsFirstRun.isFirstRun();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MyApp(savedThemeMode: savedThemeMode, firstRun));

  FlutterNativeSplash.remove();
}