import 'package:auto_route/auto_route.dart';
import 'package:upray_mobile/core/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: AnimatedSplashRoute.page, initial: true),
        AutoRoute(path: '/login', page: LogInRoute.page),
        AutoRoute(path: '/register', page: RegisterRoute.page),
      ];
}
