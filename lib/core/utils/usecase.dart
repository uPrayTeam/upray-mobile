import 'package:upray_mobile/core/utils/type_aliases.dart';

abstract class UseCase<Type, Params> {
  FutureFailable<Type> call(final Params params);
}

class NoParams {
  const NoParams();
}

class Success {
  const Success();
}
