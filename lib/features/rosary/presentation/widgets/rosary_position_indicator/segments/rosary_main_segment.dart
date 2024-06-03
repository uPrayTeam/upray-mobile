import 'package:flutter/material.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/elements/rosary_big_dot_prayer_indicator_element.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/elements/rosary_dot_prayer_indicator_element.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/segments/rosay_segment.dart';

class RosaryMainSegment extends StatelessWidget implements RosarySegment {
  const RosaryMainSegment({
    super.key,
    required this.currentGlobalPosition,
    required this.segmentPosition,
  });

  @override
  final int currentGlobalPosition;

  @override
  final int segmentPosition;

  @override
  Widget build(BuildContext context) {
    final globalPosition = RosarySegment.globalPosition(segmentPosition);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RosaryBigDotPrayerIndicatorElement(
          label: segmentPosition.toString(),
          isFilled: currentGlobalPosition > globalPosition,
          isSelected: currentGlobalPosition == globalPosition,
          globalPosition: globalPosition,
        ),
        ...List.generate(
          10,
          (i) => RosaryDotPrayerIndicatorElement(
            label: (i + 1).toString(),
            isFilled: currentGlobalPosition > globalPosition + i + 1,
            isSelected: currentGlobalPosition == globalPosition + i + 1,
            globalPosition: globalPosition + i + 1,
          ),
        ),
      ],
    );
  }
}
