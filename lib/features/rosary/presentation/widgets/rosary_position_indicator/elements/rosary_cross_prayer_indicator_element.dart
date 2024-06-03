import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upray_mobile/core/presentation/style/app_colors.dart';
import 'package:upray_mobile/core/utils/app_images.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/elements/rosary_indicator_element.dart';

class RosaryCrossPrayerIndicatorElement extends StatelessWidget implements RosaryIndicatorElement {
  const RosaryCrossPrayerIndicatorElement({
    super.key,
    required this.isFilled,
    required this.isSelected,
    required this.globalPosition,
  });

  @override
  final bool isFilled;
  @override
  final bool isSelected;
  @override
  final int globalPosition;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: isSelected ? const EdgeInsets.all(10.0) : const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.secondary.withOpacity(0.2).dark : Colors.transparent,
        shape: BoxShape.circle,
      ),
      duration: Durations.medium4,
      child: SizedBox(
        width: 70,
        height: 70,
        child: AnimatedSwitcher(
          duration: Durations.medium4,
          child: isFilled
              ? SvgPicture.asset(
                  AppIcons.crossFilled,
                  key: const ValueKey(AppIcons.crossFilled),
                  colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary.dark, BlendMode.srcIn),
                )
              : SvgPicture.asset(
                  AppIcons.crossOutlined,
                  key: const ValueKey(AppIcons.crossOutlined),
                  colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                ),
        ),
      ),
    );
  }
}
