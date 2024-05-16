import 'package:upray_mobile/core/presentation/style/custom_textfield_decoration.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomTextfieldDecoration', () {
    test('errorMaxLines returns specified value', () {
      // Arrange
      const decoration = CustomTextfieldDecoration();

      // Act
      final errorMaxLines = decoration.errorMaxLines;

      // Assert
      expect(errorMaxLines, 2);
    });

    test('labelText returns null', () {
      // Arrange
      const decoration = CustomTextfieldDecoration();

      // Act
      final labelText = decoration.labelText;

      // Assert
      expect(labelText, null);
    });

    test('hintText returns null', () {
      // Arrange
      const decoration = CustomTextfieldDecoration();

      // Act
      final hintText = decoration.hintText;

      // Assert
      expect(hintText, null);
    });
  });
}
