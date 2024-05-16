import 'core/app_config.dart';
import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.production;
  await runner.main();
}