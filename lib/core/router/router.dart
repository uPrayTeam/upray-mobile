import 'package:auto_route/auto_route.dart';
import 'package:flutter_recruitment_task/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/cardPayment',
          page: CardPaymentRoute.page,
          initial: true,
        ),
      ];
}
