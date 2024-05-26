import 'package:upray_mobile/features/auth/domain/entities/auth_token.dart';

class AuthTokenModel extends AuthToken {
  AuthTokenModel({
    required this.token,
    required this.refreshToken,
    required this.tokenValidUntil,
    required this.refreshTokenValidUntil,
  });

  factory AuthTokenModel.fromMap(Map<String, dynamic> map) {
    return AuthTokenModel(
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
      tokenValidUntil: map['tokenValidUntil'] as DateTime,
      refreshTokenValidUntil: map['refreshTokenValidUntil'] as DateTime,
    );
  }

  @override
  final String token;

  @override
  final String refreshToken;

  @override
  final DateTime tokenValidUntil;

  @override
  final DateTime refreshTokenValidUntil;

  @override
  List<Object> get props => [
        token,
        refreshToken,
        tokenValidUntil,
        refreshTokenValidUntil,
      ];

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'refreshToken': refreshToken,
      'tokenValidUntil': tokenValidUntil,
      'refreshTokenValidUntil': refreshTokenValidUntil,
    };
  }

  AuthTokenModel copyWith({
    String? token,
    String? refreshToken,
    DateTime? tokenValidUntil,
    DateTime? refreshTokenValidUntil,
  }) {
    return AuthTokenModel(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      tokenValidUntil: tokenValidUntil ?? this.tokenValidUntil,
      refreshTokenValidUntil:
          refreshTokenValidUntil ?? this.refreshTokenValidUntil,
    );
  }
}
