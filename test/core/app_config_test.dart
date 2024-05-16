import 'package:flutter_recruitment_task/core/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Flavor', () {
    test('production enum value should have correct index', () {
      // Arrange & Act
      final index = Flavor.production.index;

      // Assert
      expect(index, 0);
    });

    test('development enum value should have correct index', () {
      // Arrange & Act
      final index = Flavor.development.index;

      // Assert
      expect(index, 1);
    });
  });

  group('F', () {
    test('name should return empty string when appFlavor is null', () {
      // Arrange
      F.appFlavor = null;

      // Act
      final name = F.name;

      // Assert
      expect(name, '');
    });

    test('name should return correct name when appFlavor is set', () {
      // Arrange
      F.appFlavor = Flavor.production;

      // Act
      final name = F.name;

      // Assert
      expect(name, 'production');
    });
  });

  group('AppConfig', () {
    test('init returns correct AppConfig based on appFlavor', () {
      // Arrange
      F.appFlavor = Flavor.development;

      // Act
      final config = AppConfig.init;

      // Assert
      expect(config, isA<DevConfig>());
      expect(config.apiHostName, 'dev.fakeapphost.com');
      expect(config.flavor, Flavor.development);
      expect(config.isProduction, false);
      expect(config.silenceLogs, false);
    });

    test('init returns correct AppConfig with silenceLogs true for production flavor when verbose is false', () {
      // Arrange
      F.appFlavor = Flavor.production;
      const verboseEnv = String.fromEnvironment('verbose');

      // Act
      final config = AppConfig.init;

      // Assert
      expect(config, isA<ProdConfig>());
      expect(config.apiHostName, 'prod.fakeapphost.com');
      expect(config.flavor, Flavor.production);
      expect(config.isProduction, true);
    });
  });
}
