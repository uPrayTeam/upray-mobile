import 'package:upray_mobile/core/utils/usecase.dart';

abstract class AuthLocalDatasource {
  Future<Success> logOut();
}

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  @override
  Future<Success> logOut() {
    throw UnimplementedError();
  }
}
