import 'package:equatable/equatable.dart';
import 'package:upray_mobile/core/utils/type_aliases.dart';

abstract class LogInParams extends Equatable {
  String get email;

  String get password;

  Json toMap();
}
