import 'package:auto_route/auto_route.dart';
import 'package:upray_mobile/core/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HelloWorld.page,
        ),
      ];
}
