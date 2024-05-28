import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:upray_mobile/core/presentation/widgets/default_app_bar.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/pray_button.dart';
import 'package:upray_mobile/gen/strings.g.dart';

@RoutePage()
class RosaryPage extends StatefulWidget {
  const RosaryPage({super.key});

  @override
  State<RosaryPage> createState() => _RosaryPageState();
}

class _RosaryPageState extends State<RosaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: context.t.rosary.rosaryPrayer,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: PrayButton())],
      ),
    );
  }
}
