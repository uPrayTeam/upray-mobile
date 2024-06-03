import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upray_mobile/core/presentation/widgets/default_app_bar.dart';
import 'package:upray_mobile/features/rosary/presentation/blocs/rosary_bloc/rosary_bloc.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/pray_button.dart';
import 'package:upray_mobile/features/rosary/presentation/widgets/rosary_position_indicator/rosary_position_indicator.dart';
import 'package:upray_mobile/gen/strings.g.dart';
import 'package:upray_mobile/injection_container.dart';

@RoutePage()
class RosaryPage extends StatefulWidget {
  const RosaryPage({super.key});

  @override
  State<RosaryPage> createState() => _RosaryPageState();
}

class _RosaryPageState extends State<RosaryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RosaryBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: DefaultAppBar(
            title: context.t.rosary.rosaryPrayer,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<RosaryBloc, RosaryState>(
                builder: (context, rosaryState) {
                  return Center(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: RosaryPositionIndicator(
                        currentGlobalPosition: rosaryState.currentPosition,
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: PrayButton(
                  onPressed: () => _onPressed(context),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onPressed(BuildContext context) {
    HapticFeedback.heavyImpact();
    Future.delayed(Durations.medium1, () {
      HapticFeedback.mediumImpact();
    });

    context.read<RosaryBloc>().add(NextPositionRosaryEvent());
  }
}
