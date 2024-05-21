import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:upray_mobile/core/utils/constants.dart';

extension HashExtension on String {
  String get hashString {
    return sha256.convert(utf8.encode(this + Constants.hashSalt)).toString();
  }
}
