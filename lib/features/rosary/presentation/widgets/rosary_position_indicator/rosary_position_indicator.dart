import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/elements/rosary_cross_prayer_indicator_element.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/segments/rosary_main_segment.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/segments/rosary_trio_segment.dart';

class RosaryPositionIndicator extends StatelessWidget {
  const RosaryPositionIndicator({super.key, required this.currentGlobalPosition});

  final int currentGlobalPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RosaryCrossPrayerIndicatorElement(
          isFilled: currentGlobalPosition > 0,
          isSelected: currentGlobalPosition == 0,
          globalPosition: 0,
        ),
        RosaryTrioSegment(
          currentGlobalPosition: currentGlobalPosition,
          segmentPosition: 0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RosaryMainSegment(
              currentGlobalPosition: currentGlobalPosition,
              segmentPosition: 1,
            ),
            RosaryMainSegment(
              currentGlobalPosition: currentGlobalPosition,
              segmentPosition: 2,
            ),
            RosaryMainSegment(
              currentGlobalPosition: currentGlobalPosition,
              segmentPosition: 3,
            ),
            RosaryMainSegment(
              currentGlobalPosition: currentGlobalPosition,
              segmentPosition: 4,
            ),
            RosaryMainSegment(
              currentGlobalPosition: currentGlobalPosition,
              segmentPosition: 5,
            ),
          ],
        ),
      ],
    );
  }
}
