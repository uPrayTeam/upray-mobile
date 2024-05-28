import 'package:auto_route/auto_route.dart';
import 'package:upray_mobile/core/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/login', page: LogInRoute.page, initial: true),
        AutoRoute(path: '/register', page: RegisterRoute.page),
        AutoRoute(path: '/rosary', page: RosaryRoute.page),
      ];
}
