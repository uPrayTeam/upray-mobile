import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:upray_mobile/core/router/router.dart';
import 'package:upray_mobile/gen/strings.g.dart';
import 'package:upray_mobile/injection_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: sl<AppRouter>().config(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}
