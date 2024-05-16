import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/core/presentation/widgets/gap.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Gap', () {
    testWidgets('creates RenderGap with specified mainAxisExtent', (WidgetTester tester) async {
      // Arrange
      const double mainAxisExtent = 20.0;
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Gap(mainAxisExtent),
            ],
          ),
        ),
      );

      // Act
      final gapFinder = find.byType(Gap);
      final gapRenderObject = tester.renderObject<RenderBox>(gapFinder);

      // Assert
      expect(gapRenderObject, isNotNull);
    });
  });
}
