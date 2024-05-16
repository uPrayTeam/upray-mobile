import 'package:upray_mobile/core/router/router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppRouter', () {
    test('routes contain CardPaymentRoute', () {
      // Arrange
      final router = AppRouter();

      // Act
      final routes = router.routes;

      // Assert
      expect(routes, isNotEmpty);
      expect(routes.length, 1);
      expect(routes.first.name, 'CardPaymentRoute');
      expect(routes.first.initial, true);
    });
  });
}
