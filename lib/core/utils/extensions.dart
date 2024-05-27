import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:upray_mobile/core/utils/constants.dart';

extension HashExtension on String {
  String get strongHashString {
    if (isNotEmpty) {
      return Hmac(sha512, utf8.encode('${this[0]}${Constants.hashKeySalt}'))
          .convert(utf8.encode(this + Constants.hashSalt))
          .toString();
    }
    return this;
  }

  String get weakHashString {
    if (isNotEmpty) {
      return base64Encode(utf8.encode(this));
    }
    return this;
  }
}
