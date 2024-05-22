enum Flavor {
  production,
  development,
  local,
}

abstract class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';
}

abstract class AppConfig {
  const AppConfig._();

  String get apiHostName;

  String get api => 'http://$apiHostName:8080/upray/api';

  String get appUrl => 'https://$apiHostName';

  Flavor get flavor;

  bool get isProduction => flavor == Flavor.production;

  bool get silenceLogs;

  static AppConfig get init => _getConfig;

  static AppConfig get _getConfig {
    const isVerbose = bool.fromEnvironment('verbose');

    switch (F.appFlavor) {
      case Flavor.development:
        return DevConfig();
      case Flavor.production:
        return const ProdConfig(silenceLogs: !isVerbose);
      case Flavor.local:
        return const LocalConfig();
      default:
        throw UnimplementedError();
    }
  }
}

class DevConfig extends AppConfig {
  DevConfig() : super._();

  @override
  bool silenceLogs = false;

  @override
  String get apiHostName => '127.0.0.1';

  @override
  Flavor get flavor => Flavor.development;
}

class ProdConfig extends AppConfig {
  const ProdConfig({
    required this.silenceLogs,
  }) : super._();

  @override
  final bool silenceLogs;

  @override
  String get apiHostName => 'prod.fakeapphost.com';

  @override
  Flavor get flavor => Flavor.production;
}

class LocalConfig extends AppConfig {
  const LocalConfig() : super._();

  @override
  bool get silenceLogs => false;

  @override
  String get apiHostName => '127.0.0.1';

  @override
  Flavor get flavor => Flavor.local;
}
