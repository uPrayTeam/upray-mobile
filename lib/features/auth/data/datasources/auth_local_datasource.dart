import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:upray_mobile/core/utils/constants.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities/auth_token.dart';

abstract class AuthLocalDatasource {
  Future<Success> logOut();

  Future<Success> saveToken(AuthToken params);
}

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  AuthLocalDatasourceImpl({
    required this.storage,
  });

  final FlutterSecureStorage storage;

  @override
  Future<Success> logOut() async {
    await storage.deleteAll();

    return const Success();
  }

  @override
  Future<Success> saveToken(AuthToken params) async {
    await storage.write(
      key: StorageConstants.authTokenKey,
      value: params.token,
    );

    await storage.write(
      key: StorageConstants.refreshTokenKey,
      value: params.refreshToken,
    );

    await storage.write(
      key: StorageConstants.authTokenExpiration,
      value: params.tokenValidUntil.toIso8601String(),
    );

    await storage.write(
      key: StorageConstants.refreshTokenExpiration,
      value: params.refreshTokenValidUntil.toIso8601String(),
    );

    return const Success();
  }
}
