import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_recruitment_task/core/router/router.dart';
import 'package:flutter_recruitment_task/gen/strings.g.dart';
import 'package:flutter_recruitment_task/injection_container.dart';

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
