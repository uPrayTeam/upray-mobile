import 'package:flutter/material.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/elements/rosary_big_dot_prayer_indicator_element.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/elements/rosary_dot_prayer_indicator_element.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/segments/rosay_segment.dart';

class RosaryTrioSegment extends StatelessWidget implements RosarySegment {
  const RosaryTrioSegment({super.key, required this.currentGlobalPosition, required this.segmentPosition});

  @override
  final int currentGlobalPosition;

  @override
  final int segmentPosition;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RosaryBigDotPrayerIndicatorElement(
          label: '0',
          isFilled: currentGlobalPosition > 1,
          isSelected: currentGlobalPosition == 1,
          globalPosition: 1,
        ),
        RosaryDotPrayerIndicatorElement(
          label: '1',
          isFilled: currentGlobalPosition > 2,
          isSelected: currentGlobalPosition == 2,
          globalPosition: 2,
        ),
        RosaryDotPrayerIndicatorElement(
          label: '2',
          isFilled: currentGlobalPosition > 3,
          isSelected: currentGlobalPosition == 3,
          globalPosition: 3,
        ),
        RosaryDotPrayerIndicatorElement(
          label: '3',
          isFilled: currentGlobalPosition > 4,
          isSelected: currentGlobalPosition == 4,
          globalPosition: 4,
        ),
      ],
    );
  }
}
