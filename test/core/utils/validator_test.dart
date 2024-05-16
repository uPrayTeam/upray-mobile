import 'package:upray_mobile/core/utils/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators', () {
    test('emptyValidator returns error message when value is empty', () {
      // Arrange
      const value = '';

      // Act
      final result = Validators.emptyValidator(value);

      // Assert
      expect(result, 'Field cannot be empty');
    });

    test('emptyValidator returns null when value is not empty', () {
      // Arrange
      const value = 'Some value';

      // Act
      final result = Validators.emptyValidator(value);

      // Assert
      expect(result, null);
    });

    test('cardValidator returns error message when value is empty', () {
      // Arrange
      const value = '';

      // Act
      final result = Validators.cardValidator(value);

      // Assert
      expect(result, 'Field cannot be empty');
    });

    test('cardValidator returns error message when CC number is too short', () {
      // Arrange
      const value = '123';

      // Act
      final result = Validators.cardValidator(value);

      // Assert
      expect(result, 'CC number is too short');
    });

    test('cardValidator returns error message when CC number is invalid', () {
      // Arrange
      const value = '1234567890123456'; // Assuming this is an invalid CC number

      // Act
      final result = Validators.cardValidator(value);

      // Assert
      expect(result, 'CC number is invalid');
    });

    test('cardValidator returns null when CC number is valid', () {
      // Arrange
      const value = '4111111111111111'; // Assuming this is a valid CC number

      // Act
      final result = Validators.cardValidator(value);

      // Assert
      expect(result, null);
    });

    test('cvvValidator returns error message when value is empty', () {
      // Arrange
      const value = '';

      // Act
      final result = Validators.cvvValidator(value);

      // Assert
      expect(result, 'Field cannot be empty');
    });

    test('cvvValidator returns error message when CVV is too short', () {
      // Arrange
      const value = '12';

      // Act
      final result = Validators.cvvValidator(value);

      // Assert
      expect(result, 'CVV number is too short');
    });

    test('cvvValidator returns null when CVV is valid', () {
      // Arrange
      const value = '123';

      // Act
      final result = Validators.cvvValidator(value);

      // Assert
      expect(result, null);
    });
  });
}
