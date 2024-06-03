import 'package:flutter/material.dart';
import 'package:upray_mobile/core/presentation/style/app_colors.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/elements/rosary_indicator_element.dart';

class RosaryBigDotPrayerIndicatorElement extends StatelessWidget implements RosaryIndicatorElement {
  const RosaryBigDotPrayerIndicatorElement({
    super.key,
    required this.isFilled,
    required this.isSelected,
    required this.globalPosition,
    this.label,
  });

  @override
  final bool isFilled;
  @override
  final bool isSelected;
  @override
  final int globalPosition;

  final String? label;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.secondary.withOpacity(0.2).dark : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: isSelected ? const EdgeInsets.all(10.0) : const EdgeInsets.all(2.0),
        duration: Durations.medium4,
        child: AnimatedContainer(
          duration: Durations.medium4,
          width: 36.0,
          height: 36.0,
          decoration: BoxDecoration(
            border: Border.all(width: 4.0, color: Theme.of(context).colorScheme.secondary.dark),
            shape: BoxShape.circle,
            color: isFilled ? Theme.of(context).colorScheme.secondary.dark : Colors.transparent,
          ),
          child: label != null
              ? Center(
                  child: Text(
                    label!,
                    style: isFilled
                        ? Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20, height: 1)
                        : Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 20, height: 1),
                  ),
                )
              : null,
        ));
  }
}
