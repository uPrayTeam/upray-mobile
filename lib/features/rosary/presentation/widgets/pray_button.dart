import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upray_mobile/core/presentation/style/app_colors.dart';
import 'package:upray_mobile/gen/strings.g.dart';

class PrayButton extends StatefulWidget {
  const PrayButton({Key? key}) : super(key: key);

  @override
  State<PrayButton> createState() => _PrayButtonState();
}

class _PrayButtonState extends State<PrayButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late Animation<Color?> _colorAnimation = const AlwaysStoppedAnimation(null);
  final ValueNotifier<bool> _isPressed = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<double>(begin: 180, end: 230).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        HapticFeedback.heavyImpact();
        _controller.animateBack(180);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = Theme.of(context);
    _colorAnimation = ColorTween(
      begin: theme.colorScheme.secondary,
      end: theme.colorScheme.secondary.dark,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _isPressed.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _isPressed.value = true;
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _isPressed.value = false;
    if (_controller.status != AnimationStatus.completed) {
      _controller.reverse();
    }
  }

  void _onTapCancel() {
    _isPressed.value = false;
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowRadiusFactor: 0.3,
      glowCount: 2,
      curve: Curves.linear,
      glowColor: Theme.of(context).colorScheme.secondary,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: ValueListenableBuilder<bool>(
          valueListenable: _isPressed,
          builder: (context, isPressed, _) {
            return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  height: _animation.value,
                  decoration: BoxDecoration(
                    color: _colorAnimation.value ?? Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      context.t.rosary.pray,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 32.0),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
