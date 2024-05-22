import 'package:equatable/equatable.dart';

abstract class AuthToken extends Equatable {
  String get token;

  String get refreshToken;

  DateTime get tokenValidUntil;

  DateTime get refreshTokenValidUntil;
}
