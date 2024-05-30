import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:upray_mobile/core/router/router.gr.dart';

@RoutePage()
class AnimatedSplashPage extends StatelessWidget {
  const AnimatedSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    // Navigate to another page after a delay
    Future.delayed(const Duration(seconds: 5, milliseconds: 100), () {
      context.router.push(const LogInRoute());
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/uPray_LOGO.gif'
        ),
      ),
    );
  }
}
