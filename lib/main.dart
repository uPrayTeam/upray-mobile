import 'dart:async';

import 'package:flutter/material.dart';
import 'package:upray_mobile/gen/strings.g.dart';
import 'package:upray_mobile/injection_container.dart';

import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();

  await InjectionContainer().init();

  runApp(TranslationProvider(child: const App()));
}
